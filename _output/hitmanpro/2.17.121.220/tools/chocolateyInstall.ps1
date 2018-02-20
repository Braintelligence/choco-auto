$packageName = 'hitmanpro'
$url = 'http://dl.surfright.nl/HitmanPro.exe'
$url64 = 'http://dl.surfright.nl/HitmanPro_x64.exe'
$linkName = 'hitmanpro.lnk'
$fileName = 'hitmanpro.exe'
$destDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$filePath = Join-Path $destDir $fileName
Get-ChocolateyWebFile $packageName $filePath $url $url64 -Checksum {checksum} -ChecksumType 'sha256' -Checksum64 {checksumx64} -ChecksumType64 'sha256'

#install start menu shortcut
$targetPath = (Get-ChildItem -Path $destDir | Where-Object {$_.Name -eq 'hitmanpro.exe'}).fullname
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs $linkName 
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath

#install gui
Set-Content -Path ("$targetPath.gui") -Value $null