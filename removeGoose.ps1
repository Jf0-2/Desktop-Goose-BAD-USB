# Find the needed folders
$startupFolder = "C:\Users\$Env:username\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
$saveFolder = "C:\Users\$Env:username\goose"

# Stop Desktop Goose
Stop-Process -Name "GooseDesktop"

# Delete the startup folder shortcut
Remove-Item "$startupFolder\DesktopGoose.lnk"
# Clear out this folder
&cmd.exe /c rd /s /q $saveFolder

# Wait for user input to close the powershell window
Write-Host -NoNewLine 'Removed Desktop Goose; You can delete this folder when needed.'; $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');