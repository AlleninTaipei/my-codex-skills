[CmdletBinding()]
param([string]$Destination)

$ErrorActionPreference = 'Stop'
if (-not $Destination) {
    $codexRoot = if ($env:CODEX_HOME) { $env:CODEX_HOME } else { Join-Path $env:USERPROFILE '.codex' }
    $Destination = Join-Path $codexRoot 'skills'
}
$sourceRoot = [IO.Path]::GetFullPath((Join-Path $PSScriptRoot '../skills'))
$targetRoot = [IO.Path]::GetFullPath($Destination)
if ($targetRoot -eq $sourceRoot -or $targetRoot.StartsWith($sourceRoot + [IO.Path]::DirectorySeparatorChar, [StringComparison]::OrdinalIgnoreCase)) {
    throw 'Destination must be outside the source skills directory.'
}
$backupRoot = Join-Path (Split-Path $targetRoot -Parent) ('skill-backups/' + (Get-Date -Format 'yyyyMMdd-HHmmss-fff'))
$copied = 0
$unchanged = 0
foreach ($skill in Get-ChildItem -LiteralPath $sourceRoot -Directory) {
    if (-not (Test-Path -LiteralPath (Join-Path $skill.FullName 'SKILL.md'))) { continue }
    foreach ($file in Get-ChildItem -LiteralPath $skill.FullName -Recurse -File) {
        if ($file.FullName -match '[\\/]__pycache__[\\/]|\.py[cod]$') { continue }
        $relative = $file.FullName.Substring($sourceRoot.Length + 1)
        $target = Join-Path $targetRoot $relative
        if (Test-Path -LiteralPath $target) {
            if ((Get-FileHash -LiteralPath $file.FullName).Hash -eq (Get-FileHash -LiteralPath $target).Hash) {
                $unchanged++
                continue
            }
            $backup = Join-Path $backupRoot $relative
            New-Item -ItemType Directory -Path (Split-Path $backup -Parent) -Force | Out-Null
            Copy-Item -LiteralPath $target -Destination $backup
        }
        New-Item -ItemType Directory -Path (Split-Path $target -Parent) -Force | Out-Null
        Copy-Item -LiteralPath $file.FullName -Destination $target -Force
        $copied++
    }
}
Write-Output "Installed: $targetRoot"
Write-Output "Copied: $copied; unchanged: $unchanged"
if (Test-Path -LiteralPath $backupRoot) { Write-Output "Backup: $backupRoot" }
