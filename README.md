# WinFE
Create a Windows Forensics Environment using WinPE on a USB device. This will allow you to boot any machine into a Windows environment and use a limited selection of Windows tools (GUI or CLI).

## Usage  
`winFE.bat [tools folder] [flash drive letter]`  

Example usage:  
&nbsp;&nbsp;&nbsp;&nbsp;`winFE.bat C:\tools J`  

## Requirements
Windows 10  
Flash Drive  
Pre-determined tools folder  

## Instructions
1. Install Windows ADK for Windows 10  
`https://docs.microsoft.com/en-us/windows-hardware/get-started/adk-install`  
- Version 1809 and above:  
   Download the Windows ADK for Windows 10 AND the Windows PE add-on for the ADK  
   
- Version 1803 and lower:  
   Download the ADK for Windows 10, version x in the Other ADK downloads section  
   Select "Deployment Tools" and "Windows Preinstallation Environment" while installing. Keep all else default (ESPECIALLY THE INSTALL PATH!)  

2. Run the "Deployment and Imaging Tools Environment" as an Administrator  
`cmd /k "C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\DandISetEnv.bat"`  

3. Navigate to this script's directory  
4. Plug in a flash drive and take note of the drive letter  
5. Run the script using your tools folder and the flash drive letter  
`winFE.bat [tools folder] [flash drive letter]`  

## Creating Multiple Bootable Devices  
Note: You do not have to rerun the script to make multiple flash drives, as long as you don't want to make any changes to the image. Run the following command to create more flash drives with the same settings:  
`MakeWinPEMedia /UFD C:\WinPE [flash drive letter]`  

## Forensic Information  
Below is the testing I've done pertaining to the forensic integrity of the WinFE environment. Tests were made using FTK Imager on an internal drive, creating images onto an external USB hard drive. DON'T TAKE MY WORD FOR IT, TEST IN YOUR ENVIRONMENT FIRST BEFORE DEPLOYING IN PRODUCTION:  
- The bootable device will NOT mount internal drives automatically  
- Removable devices WILL be mounted automatically in Read-Write mode  
  - External Disks (MyPassPort, etc.) will NOT mount automatically, but will mount in Read-Write mode when mounted  
- When mounting Internal drives, they will be mounted as READ ONLY by default  
- You can traverse internal drive directories and view files without changing the integrity of the disk image  

## Example Tools  
- FTK Imager (command line)
