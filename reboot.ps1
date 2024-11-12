Write-Host "Attempting to reboot the system..." -ForegroundColor Yellow

try {
    Restart-Computer -Force -ErrorAction Stop
    Write-Host "Reboot command initiated successfully." -ForegroundColor Green
} catch {
    Write-Host "Failed to reboot the system. Error: $_" -ForegroundColor Red
    exit 1
}

exit 0
