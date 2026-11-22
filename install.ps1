# Antigravity Setup Installer (Windows PowerShell)
$ErrorActionPreference = "Stop"

$RepoDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$GeminiRoot = Join-Path $env:USERPROFILE ".gemini"
$ConfigDir = Join-Path $GeminiRoot "config"
$Timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$BackupDir = Join-Path $GeminiRoot "backup_$Timestamp"

Write-Host "=== Antigravity Setup Installer ===" -ForegroundColor Cyan
Write-Host "Target: $GeminiRoot"

# Ensure target directories exist
New-Item -ItemType Directory -Path $GeminiRoot -Force | Out-Null
New-Item -ItemType Directory -Path $ConfigDir -Force | Out-Null

function Backup-IfExists {
    param([string]$TargetPath, [string]$RelativeName)
    if (Test-Path $TargetPath) {
        if (-not (Test-Path $BackupDir)) {
            New-Item -ItemType Directory -Path $BackupDir -Force | Out-Null
        }
        $Dest = Join-Path $BackupDir $RelativeName
        $DestParent = Split-Path -Parent $Dest
        New-Item -ItemType Directory -Path $DestParent -Force | Out-Null
        Copy-Item -Path $TargetPath -Destination $Dest -Recurse -Force
        Write-Host "[Backup] $RelativeName -> $Dest" -ForegroundColor DarkGray
    }
}

# 1. Backup existing config
Backup-IfExists (Join-Path $GeminiRoot "GEMINI.md") "GEMINI.md"
Backup-IfExists (Join-Path $ConfigDir "skills") "config\skills"
Backup-IfExists (Join-Path $ConfigDir "plugins") "config\plugins"
Backup-IfExists (Join-Path $ConfigDir "mcp_config.json") "config\mcp_config.json"

# 2. Copy GEMINI.md
Copy-Item -Path (Join-Path $RepoDir "GEMINI.md") -Destination (Join-Path $GeminiRoot "GEMINI.md") -Force
Write-Host "[OK] Installed GEMINI.md" -ForegroundColor Green

# 3. Copy skills
$SrcSkills = Join-Path $RepoDir "skills"
$DstSkills = Join-Path $ConfigDir "skills"
if (Test-Path $SrcSkills) {
    if (Test-Path $DstSkills) { Remove-Item $DstSkills -Recurse -Force }
    Copy-Item -Path $SrcSkills -Destination $DstSkills -Recurse -Force
    $SkillCount = (Get-ChildItem $DstSkills -Filter "SKILL.md" -Recurse -ErrorAction SilentlyContinue).Count
    Write-Host "[OK] Installed $SkillCount standalone skills" -ForegroundColor Green
}

# 4. Copy plugins
$SrcPlugins = Join-Path $RepoDir "plugins"
$DstPlugins = Join-Path $ConfigDir "plugins"
if (Test-Path $SrcPlugins) {
    if (Test-Path $DstPlugins) { Remove-Item $DstPlugins -Recurse -Force }
    Copy-Item -Path $SrcPlugins -Destination $DstPlugins -Recurse -Force
    $PluginSkillCount = (Get-ChildItem $DstPlugins -Filter "SKILL.md" -Recurse -ErrorAction SilentlyContinue).Count
    Write-Host "[OK] Installed plugins ($PluginSkillCount plugin skills)" -ForegroundColor Green
}

# 5. Copy mcp_config.json (only if user doesn't have one or confirms overwrite)
$SrcMcp = Join-Path $RepoDir "mcp_config.json"
$DstMcp = Join-Path $ConfigDir "mcp_config.json"
if (Test-Path $SrcMcp) {
    if (Test-Path $DstMcp) {
        $ansMcp = Read-Host "mcp_config.json already exists. Overwrite it? (y/N)"
        if ($ansMcp -match "^[Yy]$") {
            Copy-Item -Path $SrcMcp -Destination $DstMcp -Force
            Write-Host "[OK] Updated mcp_config.json" -ForegroundColor Green
        } else {
            Write-Host "[Skip] Kept existing mcp_config.json" -ForegroundColor Yellow
        }
    } else {
        Copy-Item -Path $SrcMcp -Destination $DstMcp -Force
        Write-Host "[OK] Installed mcp_config.json" -ForegroundColor Green
    }
}

# 6. Check core runtime tools
Write-Host "`n--- Checking runtime tools ---" -ForegroundColor Cyan
$tools = @(
    @{ Cmd = "git";    Name = "Git";     Winget = "Git.Git" },
    @{ Cmd = "python"; Name = "Python";  Winget = "Python.Python.3.12" },
    @{ Cmd = "uv";     Name = "uv";      Winget = "astral-sh.uv" },
    @{ Cmd = "node";   Name = "Node.js"; Winget = "OpenJS.NodeJS.LTS" }
)

$missing = @()
foreach ($t in $tools) {
    if (Get-Command $t.Cmd -ErrorAction SilentlyContinue) {
        Write-Host "[OK] $($t.Name) is installed" -ForegroundColor Green
    } else {
        Write-Host "[Missing] $($t.Name) not found" -ForegroundColor Yellow
        $missing += $t
    }
}

if ($missing.Count -gt 0 -and (Get-Command "winget" -ErrorAction SilentlyContinue)) {
    $ansTools = Read-Host "Install missing tools via winget? (y/N)"
    if ($ansTools -match "^[Yy]$") {
        foreach ($m in $missing) {
            Write-Host "Installing $($m.Name)..." -ForegroundColor Cyan
            winget install --id $m.Winget -e --accept-source-agreements --accept-package-agreements
        }
    }
}

Write-Host "`nDone! Restart Antigravity (or open a new chat) to load all skills and rules." -ForegroundColor Cyan
