@ECHO OFF
Dism /Cleanup-Wim
call copype x86 C:\WinPE
call dism /Mount-Image /ImageFile:"C:\WinPE\media\sources\boot.wim" /index:1 /MountDir:"C:\WinPE\mount"
call dism /Add-Package /Image:"C:\WinPE\mount" /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\WinPE-WMI.cab"
call dism /Add-Package /Image:"C:\WinPE\mount" /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\en-us\WinPE-WMI_en-us.cab"
call dism /Add-Package /Image:"C:\WinPE\mount" /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\WinPE-NetFX.cab"
call dism /Add-Package /Image:"C:\WinPE\mount" /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\en-us\WinPE-NetFX_en-us.cab"
call dism /Add-Package /Image:"C:\WinPE\mount" /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\WinPE-Scripting.cab"
call dism /Add-Package /Image:"C:\WinPE\mount" /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\en-us\WinPE-Scripting_en-us.cab"
call dism /Add-Package /Image:"C:\WinPE\mount" /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\WinPE-PowerShell.cab"
call dism /Add-Package /Image:"C:\WinPE\mount" /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\en-us\WinPE-PowerShell_en-us.cab"
call dism /Add-Package /Image:"C:\WinPE\mount" /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\WinPE-StorageWMI.cab"
call dism /Add-Package /Image:"C:\WinPE\mount" /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\en-us\WinPE-StorageWMI_en-us.cab"
call dism /Add-Package /Image:"C:\WinPE\mount" /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\WinPE-DismCmdlets.cab"
call dism /Add-Package /Image:"C:\WinPE\mount" /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\en-us\WinPE-DismCmdlets_en-us.cab"
call dism /Add-Package /Image:"C:\WinPE\mount" /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\WinPE-HTA.cab"
call dism /Add-Package /Image:"C:\WinPE\mount" /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\en-us\WinPE-HTA_en-us.cab"
call dism /Add-Package /Image:"C:\WinPE\mount" /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\WinPE-FMAPI.cab"
call dism /Add-Package /Image:"C:\WinPE\mount" /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\WinPE-SecureStartup.cab"
call dism /Add-Package /Image:"C:\WinPE\mount" /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\en-us\WinPE-SecureStartup_en-us.cab"
call REG LOAD HKLM\WINFE2 C:\WinPE\mount\Windows\System32\config\SYSTEM
call REG ADD HKLM\WINFE2\ControlSet001\Services\MountMgr /v NoAutoMount /t REG_DWORD /d 1 /f\
call REG ADD HKLM\WINFE2\ControlSet001\Services\partmgr\Parameters /v SanPolicy /t REG_DWORD /d 4 /f
call REG ADD HKLM\WINFE2\ControlSet001\Control\FileSystem /v DisableDeleteNotification /t REG_DWORD /d 1 /f
call REG UNLOAD HKLM\WINFE2
call robocopy %1 C:\WinPE\mount\Tools /E 
call dism /Unmount-Image /MountDir:"C:\WinPE\mount" /commit
call MakeWinPEMedia /UFD C:\WinPE "%2:"
