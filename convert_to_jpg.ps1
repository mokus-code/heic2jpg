param(
    [Parameter(Mandatory=$true, ValueFromRemainingArguments=$true)]
    [string[]]$files
)

$ErrorActionPreference = 'Stop'
$logFile = 'C:\heic2jpg\error.log'

function Ensure-Log {
    if (-not (Test-Path $logFile)) {
        Set-Content -Path $logFile -Value "# Errors for run starting $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
        Add-Content -Path $logFile -Value "# Only warnings/errors for this run."    
    }
}

function Log-Warn {
    param([string]$Message)
    Ensure-Log
    $timestamp = (Get-Date).ToString('yyyy-MM-dd HH:mm:ss')
    Add-Content -Path $logFile -Value "[$timestamp] $Message"
}

# Supported input extensions
$supported = @(".heic", ".heif", ".heics", ".webp")

foreach ($file in $files) {
    if (-not (Test-Path $file)) {
        Write-Warning "File not found: $file"
        Log-Warn "File not found: $file"
        continue
    }

    $in = (Resolve-Path $file).Path
    $ext = [System.IO.Path]::GetExtension($in).ToLowerInvariant()

    if ($ext -notin $supported) {
        Write-Host "Skipping unsupported file: $in"
        continue
    }

    $out = [System.IO.Path]::ChangeExtension($in, ".jpg")

    try {
        & magick "$in" "$out" 2>$null
        if ($LASTEXITCODE -eq 0) {
            Write-Host "Converted: $in -> $out"

            # Copy timestamps
            $ts = Get-Item $in
            (Get-Item $out).CreationTime  = $ts.CreationTime
            (Get-Item $out).LastWriteTime = $ts.LastWriteTime
        }
        else {
            Write-Warning "Conversion failed: $in"
            Log-Warn "Conversion failed: $in (exit code $LASTEXITCODE)"
        }
    } catch {
        Write-Warning "Error converting ${in}: $_"
        Log-Warn "Error converting ${in}: $_"
    }
}

# If log exists but contains only header lines (no real errors), remove it
if (Test-Path $logFile) {
    $content = Get-Content -Path $logFile
    if ($content.Count -le 2) { Remove-Item $logFile -ErrorAction SilentlyContinue }
}