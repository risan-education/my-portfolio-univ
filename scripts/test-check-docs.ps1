#requires -Version 7.0
# Exercise the checker against isolated copies, never against original records.
[CmdletBinding()]
param()
$ErrorActionPreference = 'Stop'
$sourceRoot = Split-Path -Parent $PSScriptRoot
$tempBase = [IO.Path]::GetFullPath([IO.Path]::GetTempPath())
$fixtureRoot = Join-Path $tempBase ('portfolio-docs-check-' + [guid]::NewGuid().ToString('N'))
$checker = Join-Path $PSScriptRoot 'check-docs.ps1'
$shell = (Get-Process -Id $PID).Path
$encoding = [Text.UTF8Encoding]::new($false)
$passed = 0

function Expect([string]$Label, [int]$Code, [string]$Fragment) {
    $output = (& $shell -NoProfile -File $checker -Root $fixtureRoot 2>&1 | Out-String)
    if ($LASTEXITCODE -ne $Code -or -not $output.Contains($Fragment)) {
        throw "$Label failed. Expected exit $Code and '$Fragment'. Actual output: $output"
    }
    Write-Output "PASS: $Label"
    $script:passed++
}
function Mutate-And-Check([string]$Relative, [scriptblock]$Change, [string]$Fragment) {
    $path = Join-Path $fixtureRoot $Relative
    $original = [IO.File]::ReadAllBytes($path)
    try {
        & $Change $path
        Expect $Fragment 1 $Fragment
    } finally { [IO.File]::WriteAllBytes($path, $original) }
}

try {
    New-Item -ItemType Directory -Path $fixtureRoot | Out-Null
    foreach ($item in (Get-ChildItem -LiteralPath $sourceRoot -Force)) {
        if ($item.Name -in @('.git', '.scratch', '.agents', '.codex')) { continue }
        Copy-Item -LiteralPath $item.FullName -Destination $fixtureRoot -Recurse
    }
    Expect 'unchanged distribution, including legacy without date fields' 0 'PASS:'
    Mutate-And-Check 'README.md' {
        param($path)
        [IO.File]::AppendAllText($path, "`n[broken](missing-document.md)`n", $encoding)
    } 'missing link'
    Mutate-And-Check 'README.md' {
        param($path)
        [IO.File]::AppendAllText($path, "`n[broken](README.md#nonexistent-anchor)`n", $encoding)
    } 'missing anchor'
    Mutate-And-Check 'examples/journey/experiences/240415-class.md' {
        param($path)
        $body = [IO.File]::ReadAllText($path).Replace('活動日: 2024-04-15', '活動日: 2024-02-30')
        [IO.File]::WriteAllText($path, $body, $encoding)
    } 'invalid or missing 活動日'
    Mutate-And-Check 'examples/migration/target/legacy/teens-01/experiences/old-note.md' {
        param($path)
        [IO.File]::AppendAllText($path, "`nUnexpected change`n", $encoding)
    } 'migration content mismatch'
    Mutate-And-Check 'examples/journey/derived/application-a-submitted.md' {
        param($path)
        [IO.File]::AppendAllText($path, "`nUnexpected change`n", $encoding)
    } 'frozen file changed'
    Mutate-And-Check 'examples/journey/derived/application-b-v1.md' {
        param($path)
        $body = [IO.File]::ReadAllText($path).Replace('同僚2人', '同僚3人')
        [IO.File]::WriteAllText($path, $body, $encoding)
    } 'shared fact missing'
    Mutate-And-Check 'README.md' {
        param($path)
        [IO.File]::WriteAllBytes($path, [byte[]]@(0xFF, 0xFE, 0xFF))
    } 'invalid UTF-8'
    Mutate-And-Check 'templates/quick-note.md' {
        param($path)
        $body = [IO.File]::ReadAllText($path).Replace('## 出力する記録', '## Removed boundary')
        [IO.File]::WriteAllText($path, $body, $encoding)
    } 'ChatGPT worksheet prompt/body boundary missing'
    $instruction = Join-Path $fixtureRoot 'CHATGPT.md'
    $instructionBytes = [IO.File]::ReadAllBytes($instruction)
    try {
        Remove-Item -LiteralPath $instruction
        Expect 'missing ChatGPT instructions' 1 'missing required file: CHATGPT.md'
    } finally { [IO.File]::WriteAllBytes($instruction, $instructionBytes) }
    $requirements = Join-Path $fixtureRoot 'docs/my-portfolio-university-requirements.md'
    $requirementsBytes = [IO.File]::ReadAllBytes($requirements)
    try {
        [IO.File]::AppendAllText($requirements, "`n要件の更新を許容する検査用の追記。`n", $encoding)
        Expect 'requirements can be updated' 0 'PASS:'
    } finally { [IO.File]::WriteAllBytes($requirements, $requirementsBytes) }
    try {
        Remove-Item -LiteralPath $requirements
        Expect 'missing current requirements' 1 'missing required file: docs/my-portfolio-university-requirements.md'
    } finally { [IO.File]::WriteAllBytes($requirements, $requirementsBytes) }

    Mutate-And-Check 'examples/gakuchika/01-it.md' {
        param($path)
        $body = [IO.File]::ReadAllText($path).Replace('## 架空の文章', "## 架空の文章" + [Environment]::NewLine + ('あ' * 401))
        [IO.File]::WriteAllText($path, $body, $encoding)
    } 'gakuchika answer missing or over limit 400'
    Mutate-And-Check 'examples/gakuchika/01-it.md' {
        param($path)
        $body = [regex]::Replace([IO.File]::ReadAllText($path), '(?m)^- 字数: \d+字', '- 字数: 1字')
        [IO.File]::WriteAllText($path, $body, $encoding)
    } 'gakuchika character count mismatch'
    $gakuchika = Join-Path $fixtureRoot 'examples/gakuchika/01-it.md'
    $gakuchikaBytes = [IO.File]::ReadAllBytes($gakuchika)
    try {
        Remove-Item -LiteralPath $gakuchika
        Expect 'missing industry example' 1 'gakuchika example missing'
    } finally { [IO.File]::WriteAllBytes($gakuchika, $gakuchikaBytes) }

    Expect 'restored fixture' 0 'PASS:'
    Write-Output "PASS: $passed checker scenarios"
} finally {
    # Resolve and validate this exact test-owned directory before recursive cleanup.
    if (Test-Path -LiteralPath $fixtureRoot) {
        $resolved = (Resolve-Path -LiteralPath $fixtureRoot).Path
        $parent = [IO.Path]::GetFullPath((Split-Path -Parent $resolved)).TrimEnd([IO.Path]::DirectorySeparatorChar)
        if ($parent -ne $tempBase.TrimEnd([IO.Path]::DirectorySeparatorChar) -or
            (Split-Path -Leaf $resolved) -notmatch '^portfolio-docs-check-[a-f0-9]{32}$') {
            throw 'Refusing cleanup outside the test-owned temporary directory.'
        }
        Remove-Item -LiteralPath $resolved -Recurse -Force
    }
}
