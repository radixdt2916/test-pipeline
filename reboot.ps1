$LogFilePath = "D:\Reboot_logs_through_pipeline\RebootLog.txt"

function Get-Timestamp {
    return (Get-Date -Format "yyyy-MM-dd HH:mm:ss")
}

function Log-Message {
    param (
        [string]$Message,
        [string]$Color
    )
    $TimestampedMessage = "$(Get-Timestamp): $Message"
    Write-Host $TimestampedMessage -ForegroundColor $Color
    $TimestampedMessage | Out-File -FilePath $LogFilePath -Append
}

Log-Message "Starting reboot process..." "Yellow"

try {
    Log-Message "Attempting to reboot the system..." "Yellow"

    Restart-Computer -Force -ErrorAction Stop
    Log-Message "Reboot command initiated successfully." "Green"
} catch {
    Log-Message "Failed to reboot the system. Error: $_" "Red"
    exit 1
}

Log-Message "Process completed. System reboot command was issued." "Green"
Log-Message "========================================================" "White"

exit 0
