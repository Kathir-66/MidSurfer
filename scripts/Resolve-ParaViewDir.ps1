param(
    [Parameter(Mandatory = $true)]
    [string]$SearchRoot
)

$config = Get-ChildItem -Path $SearchRoot -Recurse -Filter 'ParaViewConfig.cmake' -File -ErrorAction SilentlyContinue |
    Select-Object -First 1

if (-not $config) {
    Write-Error "Could not find ParaViewConfig.cmake under $SearchRoot"
    exit 1
}

$resolved = Split-Path -Path $config.FullName -Parent
Write-Output $resolved
