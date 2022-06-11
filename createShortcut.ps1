# Find the needed folders
$startupFolder = "C:\Users\$Env:username\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
$saveFolder = "C:\Users\$Env:username\goose"

# Create the shortcut and put it in the startup folder
$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$startupFolder\DesktopGoose.lnk")
$Shortcut.TargetPath = "$saveFolder\DesktopGoose\GooseDesktop.exe"
$Shortcut.Save()