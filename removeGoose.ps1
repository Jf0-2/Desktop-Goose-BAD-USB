$startupFolder = "C:\Users\$Env:username\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
$saveFolder = "C:\Users\$Env:username\goose"

Stop-Process -Name "GooseDesktop"

Remove-Item "$startupFolder\DesktopGoose.lnk"
&cmd.exe /c rd /s /q $saveFolder

Write-Host -NoNewLine 'Removed Desktop Goose; You can delete this folder when needed.'; $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
