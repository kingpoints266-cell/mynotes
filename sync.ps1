# Git sync script for notes repo
# Usage: right-click -> "Run with PowerShell", or:
#   powershell -ExecutionPolicy Bypass -File sync.ps1

Set-Location $PSScriptRoot

# ---- 1. Pull ----
Write-Host "[1/3] Pulling latest from remote..."

# Stash uncommitted changes so pull can work
$stashed = $false
$stashOutput = git stash push -m "auto-stash" 2>&1
if ($LASTEXITCODE -eq 0 -and $stashOutput -notmatch "No local changes") {
    $stashed = $true
}

git pull origin main --rebase
if ($LASTEXITCODE -ne 0) {
    Write-Host "[FAIL] Pull failed."
    if ($stashed) { git stash pop 2>$null }
    Write-Host "Run: git status"
    exit 1
}

if ($stashed) { git stash pop 2>$null }

# ---- 2. Commit ----
Write-Host "[2/3] Committing local changes..."
git add .

$dateStr = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$null = git commit -m "auto update $dateStr" 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "  Committed OK: auto update $dateStr"
} else {
    Write-Host "  Nothing to commit, skipping."
}

# ---- 3. Push ----
Write-Host "[3/3] Pushing to GitHub..."
git push origin main
if ($LASTEXITCODE -ne 0) {
    Write-Host "[FAIL] Push failed."
    Write-Host "  Try: git pull --rebase  then retry."
    exit 1
}

Write-Host "Done."
