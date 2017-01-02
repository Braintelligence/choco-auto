﻿$packageName = '{{PackageName}}'
$installerType = 'EXE'
#Command Line Switches for the Bootstrap Web Installer: https://forums.adobe.com/message/3291894#3291894
$silentArgs = '/sAll /msi /norestart /quiet ALLUSERS=1 EULA_ACCEPT=YES'
$url = '{{DownloadUrl}}'
 
Install-ChocolateyPackage $packageName $installerType $silentArgs $url -Checksum {{checksum}} -ChecksumType 'sha256'