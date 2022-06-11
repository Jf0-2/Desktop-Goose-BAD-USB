$startupFolder = "C:\Users\$Env:username\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
$saveFolder = "C:\Users\$Env:username\goose"

Stop-Process -Name "GooseDesktop"

Remove-Item $saveFolder
Remove-Item "$startupFolder\DesktopGoose.lnk"

Write-Host -NoNewLine 'Removed Desktop Goose.'; $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
