#requires -Version 7.0
<#
Distribution checks only. Never rewrites records or fetches external content.
Fails when personal record folders hold anything besides README.md, so real records cannot slip into the distribution.
#>
[CmdletBinding()]
param([string]$Root = (Split-Path -Parent $PSScriptRoot))

$ErrorActionPreference = 'Stop'
$rootPath = [IO.Path]::GetFullPath($Root)
$errors = [Collections.Generic.List[string]]::new()
$utf8 = [Text.UTF8Encoding]::new($false, $true)
$cache = @{}
$links = 0
$recordCount = 0

function Report([string]$Message) { $errors.Add($Message) }
function Relative([string]$Path) { [IO.Path]::GetRelativePath($rootPath, $Path).Replace('\', '/') }
function Read-Text([string]$Path) {
    if (-not $cache.ContainsKey($Path)) {
        $cache[$Path] = $utf8.GetString([IO.File]::ReadAllBytes($Path)).TrimStart([char]0xFEFF)
    }
    return $cache[$Path]
}
function Without-Fences([string]$Value) {
    return [regex]::Replace($Value, '(?ms)^\s*```[^\r\n]*\r?\n.*?^\s*```\s*$', '')
}
function Anchors([string]$Value) {
    $seen = @{}
    foreach ($m in [regex]::Matches((Without-Fences $Value), '(?m)^#{1,6}\s+(.+?)\s*#*\s*$')) {
        $slug = $m.Groups[1].Value.ToLowerInvariant()
        $slug = [regex]::Replace($slug, '[^\p{L}\p{M}\p{N}_\-\s]', '')
        $slug = [regex]::Replace($slug, '\s', '-')
        if ($seen.ContainsKey($slug)) { $seen[$slug]++; "$slug-$($seen[$slug])" }
        else { $seen[$slug] = 0; $slug }
    }
}

# Enumerate only distribution directories; personal/private areas are not scanned.
$files = @(Get-ChildItem -LiteralPath $rootPath -File -Filter '*.md')
foreach ($dir in @('docs', 'templates', 'examples', 'profile', 'experiences', 'projects', 'reflections', 'annual-review', 'assets', 'career', 'derived', 'practice')) {
    $path = Join-Path $rootPath $dir
    if (Test-Path -LiteralPath $path) { $files += @(Get-ChildItem -LiteralPath $path -File -Recurse -Filter '*.md') }
}
$copilotInstructions = Join-Path $rootPath '.github/copilot-instructions.md'
if (Test-Path -LiteralPath $copilotInstructions) { $files += Get-Item -LiteralPath $copilotInstructions }
foreach ($file in $files) {
    $rel = Relative $file.FullName
    try { $body = Read-Text $file.FullName }
    catch {
        Report "$rel : invalid UTF-8"
        # Keep later link/license checks from throwing again on the same file.
        $cache[$file.FullName] = ''
        continue
    }
    $prose = [regex]::Replace((Without-Fences $body), '`[^`\r\n]+`', '')
    foreach ($m in [regex]::Matches($prose, '\[[^\]\r\n]*\]\(([^)\r\n]+)\)')) {
        $target = $m.Groups[1].Value.Trim().Trim('<', '>')
        if ($target -match '^[a-zA-Z][a-zA-Z0-9+.-]*:') { continue }
        $parts = $target.Split('#', 2)
        $local = [Uri]::UnescapeDataString(($parts[0] -split '\?')[0])
        $full = if ($local) { [IO.Path]::GetFullPath((Join-Path $file.DirectoryName $local)) } else { $file.FullName }
        $links++
        $inside = [IO.Path]::GetRelativePath($rootPath, $full)
        if ($inside -eq '..' -or $inside.StartsWith('../') -or $inside.StartsWith('..\') -or [IO.Path]::IsPathRooted($inside)) {
            Report "$rel : link escapes repository: $target"; continue
        }
        if (-not (Test-Path -LiteralPath $full)) { Report "$rel : missing link: $target"; continue }
        if ($parts.Count -gt 1 -and $parts[1] -and $full.EndsWith('.md')) {
            try {
                if ([Uri]::UnescapeDataString($parts[1]) -notin @(Anchors (Read-Text $full))) { Report "$rel : missing anchor: $target" }
            } catch { Report "$rel : unreadable link target: $target" }
        }
    }
    if ($rel -like 'examples/*' -and $body -notmatch '架空') { Report "$rel : fictional label missing" }
    # Only new activity fixtures use this format. Legacy fixtures are checked by hash below.
    if ($rel -match '^examples/journey/(experiences|projects|reflections|annual-review)/') {
        $recordCount++
        if ($file.Name -notmatch '^(\d{6}|date-unknown)-[a-z0-9-]+\.md$') { Report "$rel : invalid new record name" }
        foreach ($field in @('活動日', '記録日', '作成日', '更新日')) {
            $match = [regex]::Match($body, "(?m)^- ${field}: (.+?)\r?$")
            $value = $match.Groups[1].Value
            $date = [datetime]::MinValue
            if (-not $match.Success -or ($value -ne '未確認' -and -not [datetime]::TryParseExact($value, 'yyyy-MM-dd', [Globalization.CultureInfo]::InvariantCulture, [Globalization.DateTimeStyles]::None, [ref]$date))) { Report "$rel : invalid or missing $field" }
        }
        $activity = [regex]::Match($body, '(?m)^- 活動日: (.+?)\r?$').Groups[1].Value
        if ($activity -match '^\d{4}-\d{2}-\d{2}$') {
            $prefix = $activity.Substring(2).Replace('-', '')
            if (-not $file.Name.StartsWith("$prefix-")) { Report "$rel : activity date/name mismatch" }
        } elseif ($activity -eq '未確認' -and -not $file.Name.StartsWith('date-unknown-')) { Report "$rel : unknown date/name mismatch" }
    }
}

foreach ($required in @('README.md','AGENTS.md','CHATGPT.md','LICENSE','VERSION','CHANGELOG.md','docs/acceptance.md','templates/README.md','examples/README.md','docs/getting-started.md','docs/saving.md','docs/chatgpt-environment.md','docs/my-portfolio-university-requirements.md','docs/copilot.md','docs/claude-code.md','.github/copilot-instructions.md','examples/copilot-workflow.md','docs/chatgpt-prompts.md','examples/chatgpt-workflow.md','docs/gakuchika.md','docs/choosing-gakuchika-theme.md','docs/gakuchika-sources.md','templates/gakuchika.md','templates/gakuchika-theme.md','examples/gakuchika/README.md','CLAUDE.md','CONTRIBUTING.md','SECURITY.md','practice/README.md','.github/PULL_REQUEST_TEMPLATE.md','.github/ISSUE_TEMPLATE/improvement.yml','.github/workflows/release.yml')) {
    if (-not (Test-Path -LiteralPath (Join-Path $rootPath $required))) { Report "missing required file: $required" }
}
if (Test-Path -LiteralPath (Join-Path $rootPath 'VERSION')) {
    $version = (Read-Text (Join-Path $rootPath 'VERSION')).Trim()
    if ($version -notmatch '^\d+\.\d+\.\d+$') { Report 'VERSION must use x.y.z' }
    foreach ($name in @('README.md','CHANGELOG.md')) {
        $path = Join-Path $rootPath $name
        if ((Test-Path -LiteralPath $path) -and -not (Read-Text $path).Contains($version)) { Report "$name : VERSION missing" }
    }
}
foreach ($name in @('README.md','LICENSE','docs/maintenance.md')) {
    $path = Join-Path $rootPath $name
    if (Test-Path -LiteralPath $path) {
        $body = Read-Text $path
        if ($body -notmatch 'CC BY 4\.0' -or $body -notmatch 'Copyright © 2026 adash333') { Report "$name : license notice missing" }
    }
}

$sourceDir = Join-Path $rootPath 'examples/migration/source'
$copyDir = Join-Path $rootPath 'examples/migration/target/legacy/teens-01'
$fixtureCount = 0
if ((Test-Path -LiteralPath $sourceDir) -and (Test-Path -LiteralPath $copyDir)) {
    $originals = @(Get-ChildItem -LiteralPath $sourceDir -Recurse -File)
    $copies = @(Get-ChildItem -LiteralPath $copyDir -Recurse -File)
    if ($originals.Count -ne 4 -or $copies.Count -ne $originals.Count) { Report 'migration fixture file set changed' }
    foreach ($source in $originals) {
        $relative = [IO.Path]::GetRelativePath($sourceDir, $source.FullName)
        $copy = Join-Path $copyDir $relative
        $fixtureCount++
        if (-not (Test-Path -LiteralPath $copy)) { Report "migration copy missing: $relative" }
        elseif ((Get-FileHash -LiteralPath $source.FullName).Hash -ne (Get-FileHash -LiteralPath $copy).Hash) { Report "migration content mismatch: $relative" }
    }
} else { Report 'migration fixture directory missing' }

# Freeze the submitted example; requirements are a living document.
$frozen = @{
    'examples/journey/derived/application-a-submitted.md' = '8B90990165A28A4FAE45DA034D8A8B625A52262DB24C4EAEFD3B872BC0267CEE'
}
foreach ($entry in $frozen.GetEnumerator()) {
    $path = Join-Path $rootPath $entry.Key
    if (-not (Test-Path -LiteralPath $path)) { Report "frozen file missing: $($entry.Key)" }
    elseif ((Get-FileHash -LiteralPath $path).Hash -ne $entry.Value) { Report "frozen file changed: $($entry.Key)" }
}
foreach ($name in @('application-a-v1.md','application-a-submitted.md','application-a-v2.md','application-b-v1.md','application-legacy.md')) {
    $path = Join-Path $rootPath "examples/journey/derived/$name"
    if (-not (Test-Path -LiteralPath $path)) { Report "application fixture missing: $name"; continue }
    $body = Read-Text $path
    $match = [regex]::Match($body, '(?ms)^## 提出本文\r?\n(.+?)(?=^## |\z)')
    $answer = ($match.Groups[1].Value.Trim() -replace '\r?\n', '')
    $limit = if ($name -eq 'application-legacy.md') { 200 } else { 400 }
    if (-not $match.Success -or $answer.Length -eq 0 -or $answer.Length -gt $limit) { Report "$name : answer missing or over limit $limit" }
    if ($name -ne 'application-legacy.md') {
        foreach ($fact in @('2024年6月1日から6月30日','1枚','同僚2人','アルバイトの一員')) {
            if (-not $answer.Contains($fact)) { Report "$name : shared fact missing: $fact" }
        }
    }
}

# Only the ten distributed fictional essays are checked, never personal drafts.
$gakuchikaCount = 0
foreach ($name in @('01-it','02-manufacturing','03-finance','04-trading','05-retail','06-consulting','07-advertising','08-infrastructure','09-education','10-welfare')) {
    $relative = "examples/gakuchika/$name.md"
    $path = Join-Path $rootPath $relative
    if (-not (Test-Path -LiteralPath $path)) { Report "gakuchika example missing: $relative"; continue }
    $gakuchikaCount++
    $body = Read-Text $path
    $match = [regex]::Match($body, '(?ms)^## 架空の文章\r?\n(?<answer>.+?)(?=^## |\z)')
    $answer = $match.Groups['answer'].Value -replace '\s', ''
    if (-not $match.Success -or $answer.Length -eq 0 -or $answer.Length -gt 400) {
        Report "$relative : gakuchika answer missing or over limit 400"
    }
    $declared = [regex]::Match($body, '(?m)^- 字数: (?<count>\d+)字／400字以内。')
    if (-not $declared.Success -or [int]$declared.Groups['count'].Value -ne $answer.Length) {
        Report "$relative : gakuchika character count mismatch"
    }
}

# The distribution ships only README.md inside personal record folders; real records never belong here.
$recordFolders = @('profile', 'experiences', 'projects', 'reflections', 'annual-review', 'assets', 'career', 'derived', 'practice')
foreach ($dir in $recordFolders) {
    $path = Join-Path $rootPath $dir
    if (-not (Test-Path -LiteralPath $path)) { continue }
    foreach ($item in @(Get-ChildItem -LiteralPath $path -File -Recurse)) {
        if ($item.Name -ne 'README.md') { Report "$(Relative $item.FullName) : personal record folder must only contain README.md in the distribution" }
    }
}

# Fictional records share the real record format, so each one carries a visible warning. The frozen submitted copy is exempt.
$fictionalWarning = '> 教材の架空例です。本人の記録ではなく、活動実績にも数えません。'
$warningCount = 0
foreach ($file in @($files | Where-Object { (Relative $_.FullName) -like 'examples/journey/*' })) {
    $rel = Relative $file.FullName
    if ($rel -eq 'examples/journey/derived/application-a-submitted.md') { continue }
    $warningCount++
    if (-not (Read-Text $file.FullName).Contains($fictionalWarning)) { Report "$rel : fictional warning missing" }
}

# Every worksheet needs a usable prompt, separated from the resulting record.
$worksheetCount = 0
foreach ($file in @($files | Where-Object { (Relative $_.FullName) -like 'templates/*' -and $_.Name -ne 'README.md' })) {
    $worksheetCount++
    $body = Read-Text $file.FullName
    $prompt = [regex]::Match($body, '(?ms)^## ChatGPTへの依頼（記録本文には含めない）\r?\n(?<prompt>.+?)^## 出力する記録\r?$')
    if (-not $prompt.Success -or $prompt.Groups['prompt'].Value -notmatch '(?m)^> .+') {
        Report "$(Relative $file.FullName) : ChatGPT worksheet prompt/body boundary missing"
    }
}
if ($worksheetCount -lt 27) { Report 'ChatGPT worksheet set incomplete' }

if ($errors.Count) {
    foreach ($problem in $errors) { Write-Output "ERROR: $problem" }
    Write-Output "FAIL: $($errors.Count) problem(s)"
    exit 1
}
Write-Output "PASS: $($files.Count) Markdown files, $links local links, $recordCount new activity records, $fixtureCount identical migration copies, $worksheetCount ChatGPT worksheets, $gakuchikaCount fictional industry essays, $warningCount labeled fictional records; frozen files, application limits, facts, empty record folders and license notices verified."
exit 0
