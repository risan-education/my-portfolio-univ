#!/usr/bin/env python3
"""Distribution checks (Python edition), equivalent to scripts/check-docs.ps1.

Never rewrites records or fetches external content. Fails when personal record
folders hold anything besides README.md, so real records cannot slip into the
distribution. Kept in step with the PowerShell checker; both run in CI.
"""
from __future__ import annotations

import hashlib
import os
import re
import sys
import unicodedata
from datetime import datetime
from pathlib import Path
from urllib.parse import unquote

ROOT = Path(sys.argv[1] if len(sys.argv) > 1 else Path(__file__).resolve().parent.parent).resolve()
errors: list[str] = []
cache: dict[Path, str] = {}
links = 0
record_count = 0


def report(message: str) -> None:
    errors.append(message)


def relative(path: Path) -> str:
    return path.relative_to(ROOT).as_posix()


def read_text(path: Path) -> str:
    if path not in cache:
        cache[path] = path.read_bytes().decode('utf-8', errors='strict').lstrip('﻿')
    return cache[path]


def without_fences(value: str) -> str:
    return re.sub(r'(?ms)^\s*```[^\r\n]*\r?\n.*?^\s*```\s*$', '', value)


def anchors(value: str) -> list[str]:
    seen: dict[str, int] = {}
    result = []
    for m in re.finditer(r'(?m)^#{1,6}\s+(.+?)\s*#*\s*$', without_fences(value)):
        slug = m.group(1).lower()
        slug = ''.join(ch for ch in slug if unicodedata.category(ch)[0] in 'LMN' or ch in '_-' or ch.isspace())
        slug = re.sub(r'\s', '-', slug)
        if slug in seen:
            seen[slug] += 1
            result.append(f'{slug}-{seen[slug]}')
        else:
            seen[slug] = 0
            result.append(slug)
    return result


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest().upper()


# Enumerate only distribution directories; personal/private areas are not scanned.
files = sorted(p for p in ROOT.glob('*.md') if p.is_file())
for d in ['docs', 'templates', 'examples', 'profile', 'experiences', 'projects', 'reflections', 'annual-review', 'assets', 'career', 'derived', 'practice']:
    path = ROOT / d
    if path.is_dir():
        files += sorted(p for p in path.rglob('*.md') if p.is_file())
copilot = ROOT / '.github/copilot-instructions.md'
if copilot.is_file():
    files.append(copilot)

for file in files:
    rel = relative(file)
    try:
        body = read_text(file)
    except UnicodeDecodeError:
        report(f'{rel} : invalid UTF-8')
        cache[file] = ''
        continue
    prose = re.sub(r'`[^`\r\n]+`', '', without_fences(body))
    for m in re.finditer(r'\[[^\]\r\n]*\]\(([^)\r\n]+)\)', prose):
        target = m.group(1).strip().strip('<>')
        if re.match(r'^[a-zA-Z][a-zA-Z0-9+.-]*:', target):
            continue
        parts = target.split('#', 1)
        local = unquote(parts[0].split('?')[0])
        full = (file.parent / local).resolve() if local else file
        links += 1
        try:
            full.relative_to(ROOT)
        except ValueError:
            report(f'{rel} : link escapes repository: {target}')
            continue
        if not full.exists():
            report(f'{rel} : missing link: {target}')
            continue
        if len(parts) > 1 and parts[1] and full.suffix == '.md':
            try:
                if unquote(parts[1]) not in anchors(read_text(full)):
                    report(f'{rel} : missing anchor: {target}')
            except UnicodeDecodeError:
                report(f'{rel} : unreadable link target: {target}')
    if rel.startswith('examples/') and '架空' not in body:
        report(f'{rel} : fictional label missing')
    # Only new activity fixtures use this format. Legacy fixtures are checked by hash below.
    if re.match(r'^examples/journey/(experiences|projects|reflections|annual-review)/', rel):
        record_count += 1
        if not re.match(r'^(\d{6}|date-unknown)-[a-z0-9-]+\.md$', file.name):
            report(f'{rel} : invalid new record name')
        for field in ['活動日', '記録日', '作成日', '更新日']:
            match = re.search(rf'(?m)^- {field}: (.+?)\r?$', body)
            value = match.group(1) if match else ''
            ok = False
            if match and value == '未確認':
                ok = True
            elif match:
                try:
                    datetime.strptime(value, '%Y-%m-%d')
                    ok = len(value) == 10
                except ValueError:
                    ok = False
            if not ok:
                report(f'{rel} : invalid or missing {field}')
        activity_match = re.search(r'(?m)^- 活動日: (.+?)\r?$', body)
        activity = activity_match.group(1) if activity_match else ''
        if re.match(r'^\d{4}-\d{2}-\d{2}$', activity):
            prefix = activity[2:].replace('-', '')
            if not file.name.startswith(f'{prefix}-'):
                report(f'{rel} : activity date/name mismatch')
        elif activity == '未確認' and not file.name.startswith('date-unknown-'):
            report(f'{rel} : unknown date/name mismatch')

REQUIRED = ['README.md', 'AGENTS.md', 'CHATGPT.md', 'LICENSE', 'NOTICE.md', 'VERSION', 'CHANGELOG.md', 'docs/acceptance.md', 'templates/README.md', 'examples/README.md', 'docs/getting-started.md', 'docs/saving.md', 'docs/chatgpt-environment.md', 'docs/my-portfolio-university-requirements.md', 'docs/copilot.md', 'docs/claude-code.md', '.github/copilot-instructions.md', 'examples/copilot-workflow.md', 'docs/chatgpt-prompts.md', 'examples/chatgpt-workflow.md', 'docs/gakuchika.md', 'docs/choosing-gakuchika-theme.md', 'docs/gakuchika-sources.md', 'templates/gakuchika.md', 'templates/gakuchika-theme.md', 'examples/gakuchika/README.md', 'examples/gakuchika/companies/README.md', 'CLAUDE.md', 'CONTRIBUTING.md', 'SECURITY.md', 'practice/README.md', '.github/PULL_REQUEST_TEMPLATE.md', '.github/ISSUE_TEMPLATE/improvement.yml', '.github/workflows/release.yml', 'CHATGPT-short.md', 'docs/chatgpt-github.md', 'templates/ai-context-current.md', 'templates/work-experience.md', 'docs/after-university.md', 'docs/ai.md', 'scripts/check-docs.ps1']
for required in REQUIRED:
    if not (ROOT / required).exists():
        report(f'missing required file: {required}')

if (ROOT / 'VERSION').exists():
    version = read_text(ROOT / 'VERSION').strip()
    if not re.match(r'^\d+\.\d+\.\d+$', version):
        report('VERSION must use x.y.z')
    for name in ['README.md', 'CHANGELOG.md']:
        path = ROOT / name
        if path.exists() and version not in read_text(path):
            report(f'{name} : VERSION missing')

for name in ['README.md', 'NOTICE.md', 'docs/maintenance.md']:
    path = ROOT / name
    if path.exists():
        body = read_text(path)
        if 'CC BY 4.0' not in body or 'Copyright © 2026 adash333' not in body:
            report(f'{name} : license notice missing')
license_path = ROOT / 'LICENSE'
if license_path.exists() and 'Attribution 4.0 International' not in license_path.read_bytes().decode('utf-8', errors='replace'):
    report('LICENSE : official CC BY 4.0 legal code missing')

source_dir = ROOT / 'examples/migration/source'
copy_dir = ROOT / 'examples/migration/target/legacy/teens-01'
fixture_count = 0
if source_dir.is_dir() and copy_dir.is_dir():
    originals = sorted(p for p in source_dir.rglob('*') if p.is_file())
    copies = [p for p in copy_dir.rglob('*') if p.is_file()]
    if len(originals) != 4 or len(copies) != len(originals):
        report('migration fixture file set changed')
    for source in originals:
        rel_path = source.relative_to(source_dir)
        copy = copy_dir / rel_path
        fixture_count += 1
        if not copy.exists():
            report(f'migration copy missing: {rel_path}')
        elif sha256(source) != sha256(copy):
            report(f'migration content mismatch: {rel_path}')
else:
    report('migration fixture directory missing')

# Freeze the submitted example and the official license text; requirements are a living document.
FROZEN = {
    'examples/journey/derived/application-a-submitted.md': '8B90990165A28A4FAE45DA034D8A8B625A52262DB24C4EAEFD3B872BC0267CEE',
    'LICENSE': '9BA9550AD48438D0836DDAB3DA480B3B69FFA0AAC7B7878B5A0039E7AB429411',
}
for key, digest in FROZEN.items():
    path = ROOT / key
    if not path.exists():
        report(f'frozen file missing: {key}')
    elif sha256(path) != digest:
        report(f'frozen file changed: {key}')

for name in ['application-a-v1.md', 'application-a-submitted.md', 'application-a-v2.md', 'application-b-v1.md', 'application-legacy.md']:
    path = ROOT / 'examples/journey/derived' / name
    if not path.exists():
        report(f'application fixture missing: {name}')
        continue
    body = read_text(path)
    match = re.search(r'(?ms)^## 提出本文\r?\n(.+?)(?=^## |\Z)', body)
    answer = re.sub(r'\r?\n', '', match.group(1).strip()) if match else ''
    limit = 200 if name == 'application-legacy.md' else 400
    if not match or len(answer) == 0 or len(answer) > limit:
        report(f'{name} : answer missing or over limit {limit}')
    if name != 'application-legacy.md':
        for fact in ['2024年6月1日から6月30日', '1枚', '同僚2人', 'アルバイトの一員']:
            if fact not in answer:
                report(f'{name} : shared fact missing: {fact}')

# Only the ten distributed fictional essays are checked, never personal drafts.
gakuchika_count = 0
for name in ['01-it', '02-manufacturing', '03-finance', '04-trading', '05-retail', '06-consulting', '07-advertising', '08-infrastructure', '09-education', '10-welfare']:
    rel = f'examples/gakuchika/{name}.md'
    path = ROOT / rel
    if not path.exists():
        report(f'gakuchika example missing: {rel}')
        continue
    gakuchika_count += 1
    body = read_text(path)
    match = re.search(r'(?ms)^## 架空の文章\r?\n(?P<answer>.+?)(?=^## |\Z)', body)
    answer = re.sub(r'\s', '', match.group('answer')) if match else ''
    if not match or len(answer) == 0 or len(answer) > 400:
        report(f'{rel} : gakuchika answer missing or over limit 400')
    declared = re.search(r'(?m)^- 字数: (?P<count>\d+)字／400字以内。', body)
    if not declared or int(declared.group('count')) != len(answer):
        report(f'{rel} : gakuchika character count mismatch')

# Company-specific fictional essays share the industry essays' 400-character contract.
company_count = 0
for path in sorted((ROOT / 'examples/gakuchika/companies').glob('*.md')):
    if path.name == 'README.md':
        continue
    rel = relative(path)
    company_count += 1
    body = read_text(path)
    match = re.search(r'(?ms)^## 架空の文章\r?\n(?P<answer>.+?)(?=^## |\Z)', body)
    answer = re.sub(r'\s', '', match.group('answer')) if match else ''
    if not match or len(answer) == 0 or len(answer) > 400:
        report(f'{rel} : gakuchika answer missing or over limit 400')
    declared = re.search(r'(?m)^- 字数: (?P<count>\d+)字／400字以内。', body)
    if not declared or int(declared.group('count')) != len(answer):
        report(f'{rel} : gakuchika character count mismatch')

# The distribution ships only README.md inside personal record folders; real records never belong here.
for d in ['profile', 'experiences', 'projects', 'reflections', 'annual-review', 'assets', 'career', 'derived', 'practice']:
    path = ROOT / d
    if not path.is_dir():
        continue
    for item in sorted(p for p in path.rglob('*') if p.is_file()):
        if item.name != 'README.md':
            report(f'{relative(item)} : personal record folder must only contain README.md in the distribution')

# Fictional records (student journey and after-university) share the real record format, so each one carries a visible warning. The frozen submitted copy is exempt.
FICTIONAL_WARNING = '> 教材の架空例です。本人の記録ではなく、活動実績にも数えません。'
warning_count = 0
for file in files:
    rel = relative(file)
    if not (rel.startswith('examples/journey/') or rel.startswith('examples/after-university/')):
        continue
    if rel == 'examples/journey/derived/application-a-submitted.md':
        continue
    warning_count += 1
    if FICTIONAL_WARNING not in read_text(file):
        report(f'{rel} : fictional warning missing')

# Every worksheet needs a usable prompt, separated from the resulting record.
worksheet_count = 0
for file in files:
    rel = relative(file)
    if not rel.startswith('templates/') or file.name == 'README.md':
        continue
    worksheet_count += 1
    body = read_text(file)
    prompt = re.search(r'(?ms)^## ChatGPTへの依頼（記録本文には含めない）\r?\n(?P<prompt>.+?)^## 出力する記録\r?$', body)
    if not prompt or not re.search(r'(?m)^> .+', prompt.group('prompt')):
        report(f'{rel} : ChatGPT worksheet prompt/body boundary missing')
if worksheet_count < 27:
    report('ChatGPT worksheet set incomplete')

if errors:
    for problem in errors:
        print(f'ERROR: {problem}')
    print(f'FAIL: {len(errors)} problem(s)')
    sys.exit(1)
print(f'PASS: {len(files)} Markdown files, {links} local links, {record_count} new activity records, {fixture_count} identical migration copies, {worksheet_count} ChatGPT worksheets, {gakuchika_count} fictional industry essays, {company_count} fictional company essays, {warning_count} labeled fictional records; frozen files, application limits, facts, empty record folders and license notices verified.')
