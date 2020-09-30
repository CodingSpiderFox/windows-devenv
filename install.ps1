### Download/install software

git.exe config --global user.name "codingspiderfox"
git.exe config --global user.email "codingspiderfox@gmail.com"

start ms-settings:nightlight

.\install_chocolatey.ps1

del "C:\Users\user\Desktop\Microsoft Edge.lnk"

choco install -y texstudio
choco install -y texnicenter
choco install -y strawberryperl
choco install -y foxitreader
choco install -y choco-upgrade-all-at-startup
choco install -y powertoys
choco install -y google-backup-and-sync
choco install -y firefox
choco install -y libreoffice
choco install -y veracrypt
choco install -y winpcap
choco install -y kdiff3
choco install -y vscode
choco install -y chromium
choco install -y correttojdk
choco install -y 7zip.install
choco install -y vlc
choco install -y git.install
choco install -y sysinternals
choco install -y wget
choco install -y curl
choco install -y filezilla
choco install -y inkscape
choco install -y gimp
choco install -y python
choco install -y thunderbird
choco install -y virtualbox
choco install -y cygwin
choco install -y wireshark
choco install -y openhardwaremonitor
choco install -y spotify
choco install -y jq
choco install -y tortoisegit
choco install -y maven
choco install -y winmerge
choco install -y rufus
choco install -y gpg4win
choco install -y telegram.install
choco install -y postman
choco install -y mobaxterm
choco install -y pia

choco install -y tuxguitar
choco install -y reaper
choco install -y reaper-sws-extension

choco install -y steam
choco install -y discord
choco install -y origin

#choco install -y jdk8
#choco install -y jre8
#choco install intellijidea-community
#choco install androidstudio
#choco install vmware-workstation-player
#choco install -y gitkraken
#choco install -y flutter --pre 
#choco install nvidia-display-driver
#choco install cmake
#vs2019 community
#choco install -y cpu-z
#choco install -y gpu-z
#choco install -y logitechgaming

git clone https://github.com/CodingSpiderFox/Ossify
cd Ossify
.\Ossify-Win10.ps1
cd ..

#################################
### Install vscode extensions ###
#################################
code --install-extension tabnine.tabnine-vscode
code --install-extension ms-vscode-remote.remote-wsl
code --install-extension james-yu.latex-workshop
code --install-extension kameshkotwani.google-search
code --install-extension hashicorp.terraform
code --install-extension samuelcolvin.jinjahtml
code --install-extension coolbear.systemd-unit-file
code --install-extension aaron-bond.better-comments
code --install-extension mathiasfrohlich.kotlin
code --install-extension ms-python.python
code --install-extension ms-vscode.powershell
code --install-extension mrorz.language-gettext
code --install-extension ms-vscode.go
code --install-extension dotjoshjohnson.xml
code --install-extension ms-azuretools.vscode-docker
code --install-extension webfreak.debug
code --install-extension ms-vscode.cpptools
code --install-extension thiagoabreu.vala
code --install-extension vscjava.vscode-java-pack
code --install-extension esbenp.prettier-vscode
code --install-extension msjsdiag.debugger-for-chrome
code --install-extension dsznajder.es7-react-js-snippets
code --install-extension msjsdiag.vscode-react-native
code --install-extension eg2.tslint
code --install-extension pivotal.vscode-boot-dev-pack
code --install-extension zignd.html-css-class-completion
code --install-extension gencer.html-slim-scss-css-class-completion
code --install-extension abusaidm.html-snippets
code --install-extension cssho.vscode-svgviewer
code --install-extension jock.svg
code --install-extension rogalmic.bash-debug
code --install-extension peterjausovec.vscode-docker
code --install-extension eamodio.gitlens
code --install-extension technosophos.vscode-helm
code --install-extension rust-lang.rust
code --install-extension ms-vscode-remote.remote-wsl
code --install-extension ms-vscode.powershell

curl.exe -L -o ShadowSetup.exe https://update.shadow.tech/launcher/prod/win/x64/ShadowSetup.exe
.\ShadowSetup.exe
curl.exe -L -o ubuntu.appx https://aka.ms/wsl-ubuntu-1804
Add-AppxPackage .\ubuntu.appx
#del .\ubuntu.appx
$CheckNewScriptFeature = "Please check whether WSL ubuntu distribution was successfully downloaded and installed, then remove this request from script, uncomment the del .appx instruction above and push changes to git"
$Prompt8 = [Windows.MessageBox]::Show($CheckNewScriptFeature, "Install check", $Button, $Warn)
Switch ($Prompt8) {
    Yes {
        
        Write-Host ""
    }
    No {
        Exit
    }
}

Install-WindowsFeature -name Telnet-Client
Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName Microsoft-Windows-Subsystem-Linux

reg import .\Hide_Cortana_button_on_taskbar.reg

cd C:\Users\user\Downloads
Invoke-WebRequest -OutFile "user.js" -Uri https://bitbucket.org/CodingSpiderFox/linux-devenv/raw/HEAD/home/user/firefox/additional_forwk.js
$profileFolder=Get-ChildItem "C:\Users\user\AppData\Roaming\Mozilla\Firefox\Profiles" -filter "*default-release*" -Directory |  % { $_.fullname }
xcopy user.js "$profileFolder"
setx /M PATH "$Env:PATH;C:\Users\user\windows-devenv\home\user\aliases;C:\Program Files\Git\bin;C:\ProgramData\chocolatey\bin;C:\Program Files\REAPER (x64)"

# reaper must be started once so the configuration directory under AppData\Roaming is created
cmd /c "C:\Program Files\REAPER (x64)\reaper.exe"
rmdir "C:\Users\user\Documents\REAPER Media"
xcopy /Y "home\user\AppData\Roaming\REAPER\*.*" "C:\Users\user\AppData\Roaming\REAPER\"

Invoke-WebRequest -OutFile "ublock.xpi" -Uri https://addons.mozilla.org/firefox/downloads/latest/ublock-origin
Invoke-WebRequest -OutFile "https.xpi" -Uri https://addons.mozilla.org/firefox/downloads/latest/https-everywhere
Invoke-WebRequest -OutFile "review.xpi" -Uri https://addons.mozilla.org/firefox/downloads/latest/reviewmeta-com-review-helper

cmd /c '"C:\Program Files\Mozilla Firefox\firefox.exe" ublock.xpi https.xpi review.xpi'

Invoke-WebRequest -OutFile "uninstall_flash.exe" -Uri https://fpdownload.macromedia.com/get/flashplayer/current/support/uninstall_flash_player.exe
.\uninstall_flash.exe

GPUPDATE /force

# Taken from https://github.com/Gaz2600/Windows-10-1803-Post-Install-Script/blob/master/Run_Once.ps1 which is under "Unlicense" license

Start-Job -Name .Net3.5 -ScriptBlock {
    Install-WindowsFeature Net-Framework-Core -source z:\Sources\sxs
}
Wait-Job -Name .Net3.5

Add-WindowsCapability -Online -Name OpenSSH.Client*

### Copy Current Location C: ###
Push-Location

### Change Location to HKLM: ###
Set-Location HKLM:

### Remove Store from TaskBar HKLM ###
$RegistryPath = "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer"
$Name  ="NoPinningStoreToTaskbar"
$Value = 1
IF(!(Test-Path $registryPath))
{New-Item -Path $RegistryPath -Force | Out-Null}
New-ItemProperty -Path $RegistryPath -Name $name -Value $value -PropertyType DWORD -Force | Out-Null
$RegistryPath=$null; $Name=$null;  $Value=$null

### No New Application Alert ### *Prevents windows from prompting to use Edge vs Chrome on first launch
$RegistryPath = "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer"
$Name  ="NoNewAppAlert"
$Value = 1
IF(!(Test-Path $registryPath))
{New-Item -Path $RegistryPath -Force | Out-Null}
New-ItemProperty -Path $RegistryPath -Name $name -Value $value -PropertyType DWORD -Force | Out-Null
$RegistryPath=$null; $Name=$null;  $Value=$null

### Disable Windows Ink ###
$RegistryPath = "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace"
$Name  ="AllowWindowsInkWorkspace "
$Value = 0
IF(!(Test-Path $registryPath))
{New-Item -Path $RegistryPath -Force | Out-Null}
New-ItemProperty -Path $RegistryPath -Name $name -Value $value -PropertyType DWORD -Force | Out-Null
$RegistryPath=$null; $Name=$null;  $Value=$null

### Enable Windows Defender ###
$RegistryPath = "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender"
$Name  ="DisableAntiSpyware"
$Value = 0
IF(!(Test-Path $registryPath))
{New-Item -Path $RegistryPath -Force | Out-Null}
Set-ItemProperty -Path $RegistryPath -Name $name -Value $value -Force | Out-Null
$RegistryPath=$null; $Name=$null;  $Value=$null

### Remove Edge Icon From the Desktop ###
$RegistryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer"
$Name  ="DisableEdgeDesktopShortcutCreation"
$Value = 1
IF(!(Test-Path $registryPath))
{New-Item -Path $RegistryPath -Force | Out-Null}
New-ItemProperty -Path $RegistryPath -Name $name -Value $value -Force | Out-Null
$RegistryPath=$null; $Name=$null;  $Value=$null

Pop-Location

### Load HKCU Hive ###
reg load HKU\Temp C:\Users\Default\ntuser.dat

#Remove Mail App in Taskbar
reg add HKU\Temp\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband\AuxilliaryPins /v MailPin /t REG_DWORD /d 2 /f
#Cortana Bar
reg add HKU\Temp\Software\Microsoft\Windows\CurrentVersion\Search /v SearchboxTaskbarMode /t REG_DWORD /d 0 /f

#Hide People
reg add HKU\Temp\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People /v PeopleBand /t REG_DWORD /d 0 /f
#Show all taskbar icons
reg add HKU\Temp\Software\Microsoft\Windows\CurrentVersion\Explorer /v EnableAutoTray /t REG_DWORD /d 0 /f
#Show seconds on clock
reg add HKU\Temp\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v ShowSecondsInSystemClock /t REG_DWORD /d 1 /f
#Remove Onedrive from tray
reg delete HKU\Temp\Software\Microsoft\Windows\CurrentVersion\Run /v OneDriveSetup /f
reg add HKU\Temp\Software\Microsoft\Windows\CurrentVersion\Run /v OneDriveSetup /t REG_SZ /d "C:\Windows\SysWOW64\OneDriveSetup.exe /silent" /f
#Turn off Feedback Hub Notifications
reg add HKU\Temp\SOFTWARE\Microsoft\Siuf\Rules /v NumberOfSIUFInPeriod /t REG_DWORD /d 0 /f
reg add HKU\Temp\SOFTWARE\Microsoft\Siuf\Rules /v PeriodInNanoSeconds /t REG_QWORD /d 0  /f
#Turn off Suggested Apps
reg add HKU\Temp\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v SubscribedContent-338388Enabled /t REG_DWORD /d 1 /f
#Disable Location Service
reg add HKU\Temp\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{BFA794E4-F964-4FDB-90F6-51056BFE4B44} /v Value /t REG_SZ /d Deny /f
reg add HKU\Temp\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Permissions\{BFA794E4-F964-4FDB-90F6-51056BFE4B44} /v SensorPermissionState /t REG_DWORD /d 0 /f
#Disable Occasonally show suggestions in Start
reg add HKU\Temp\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v SystemPaneSuggestionsEnabled  /t REG_DWORD /d 0 /f
#(Automatically free up space)
reg add HKU\Temp\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy /v 01 /t REG_DWORD /d 1 /f
#(Delete temporary files that my apps aren't using)
reg add HKU\Temp\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy /v 04 /t REG_DWORD /d 1 /f
#(Delete files that have been in the recycle bin for over 30 days)
reg add HKU\Temp\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy /v 08 /t REG_DWORD /d 1 /f

### Unload HKCU Hive ###
reg unload HKU\Temp C:\Users\Default\ntuser.dat

### Sync time
w32tm /unregister
w32tm /register
net start w32time
w32tm /resync /force

### File type associations
Start-Job -Name Job7 -ScriptBlock {
    ### Set Default App/File Associations ###
    $filepath ="$env:SystemDrive\Windows\System32" 
    $filename = "\oemdefaultassociations.xml" 
    $filefullpath = $filepath + $filename 
    $findstring = '<Association Identifier=".pdf" ProgId="AppXd4nrz8ff68srnhf9t5a8sbjyar1cr723" ApplicationName="Microsoft Edge" ApplyOnUpgrade="true" OverwriteIfProgIdIs="AppXk660crfh0gw7gd9swc1nws708mn7qjr1" />'
    $replacestring = '<Association Identifier=".pdf" ProgId="AcroExch.Document.DC" ApplicationName="Adobe Acrobat Reader DC" ApplyOnUpgrade="true" OverwriteIfProgIdIs="AppXd4nrz8ff68srnhf9t5a8sbjyar1cr723" />'

    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath

    $filepath = "$env:SystemDrive\Windows\System32"
    $filename = "\oemdefaultassociations.xml"
    $filefullpath = $filepath + $filename

    ##################
    #      Mail      #
    ##################

    $findstring    = '<Association Identifier="mailto" ProgId="AppXydk58wgm44se4b399557yyyj1w7mbmvd" ApplicationName="Mail" ApplyOnUpgrade="true" />'
    $replacestring = '<Association Identifier="mailto" ProgId="ChromeHTML" ApplicationName="Google Chrome" ApplyOnUpgrade="true"/>'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null
    
    ##################
    #  Media Player  #
    ##################
    $findstring    = '<Association Identifier=".3g2" ProgId="AppX6eg8h5sxqq90pv53845wmnbewywdqq5h" ApplicationName="Movies &amp; TV" ApplyOnUpgrade="true" OverwriteIfProgIdIs="AppXhjhjmgrfm2d7rd026az898dy2p1pcsyt;WMP11.AssocFile.3G2" />'
    $replacestring = '<Association Identifier=".3g2" ProgId="VLC.3g2" ApplicationName="VLC" ApplyOnUpgrade="true" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null

    $findstring    = '<Association Identifier=".3gp" ProgId="AppX6eg8h5sxqq90pv53845wmnbewywdqq5h" ApplicationName="Movies &amp; TV" ApplyOnUpgrade="true" OverwriteIfProgIdIs="AppXhjhjmgrfm2d7rd026az898dy2p1pcsyt;WMP11.AssocFile.3GP" />'
    $replacestring = '<Association Identifier=".3gp" ProgId="VLC.3gp" ApplicationName="VLC" ApplyOnUpgrade="true" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null

    $findstring    = '<Association Identifier=".3gp2" ProgId="WMP11.AssocFile.3G2" ApplicationName="Windows Media Player" />'
    $replacestring = '<Association Identifier=".3gp2" ProgId="VLC.3gp2" ApplicationName="VLC" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null

    $findstring    = '<Association Identifier=".3gpp" ProgId="AppX6eg8h5sxqq90pv53845wmnbewywdqq5h" ApplicationName="Movies &amp; TV" ApplyOnUpgrade="true" OverwriteIfProgIdIs="AppXhjhjmgrfm2d7rd026az898dy2p1pcsyt;WMP11.AssocFile.3GP" />'
    $replacestring = '<Association Identifier=".3gpp" ProgId="VLC.3gpp" ApplicationName="VLC" ApplyOnUpgrade="true" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null

    $findstring    = '<Association Identifier=".aac" ProgId="AppXqj98qxeaynz6dv4459ayz6bnqxbyaqcs" ApplicationName="Music" ApplyOnUpgrade="true" OverwriteIfProgIdIs="WMP11.AssocFile.ADTS" />'
    $replacestring = '<Association Identifier=".aac" ProgId="VLC.aac" ApplicationName="VLC" ApplyOnUpgrade="true" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null

    $findstring    = '<Association Identifier=".adts" ProgId="AppXqj98qxeaynz6dv4459ayz6bnqxbyaqcs" ApplicationName="Music" ApplyOnUpgrade="true" OverwriteIfProgIdIs="WMP11.AssocFile.ADTS" />'
    $replacestring = '<Association Identifier=".adts" ProgId="VLC.adts" ApplicationName="VLC" ApplyOnUpgrade="true" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null

    $findstring    = '<Association Identifier=".ac3" ProgId="AppXqj98qxeaynz6dv4459ayz6bnqxbyaqcs" ApplicationName="Music" ApplyOnUpgrade="true" />'
    $replacestring = '<Association Identifier=".ac3" ProgId="VLC.ac3" ApplicationName="VLC" ApplyOnUpgrade="true" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null

    $findstring    = '<Association Identifier=".adt" ProgId="AppXqj98qxeaynz6dv4459ayz6bnqxbyaqcs" ApplicationName="Music" ApplyOnUpgrade="true" OverwriteIfProgIdIs="WMP11.AssocFile.ADTS" />'
    $replacestring = '<Association Identifier=".adt" ProgId="VLC.adt" ApplicationName="VLC" ApplyOnUpgrade="true" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null

    $findstring    = '<Association Identifier=".amr" ProgId="AppXqj98qxeaynz6dv4459ayz6bnqxbyaqcs" ApplicationName="Music" ApplyOnUpgrade="true" />'
    $replacestring = '<Association Identifier=".amr" ProgId="VLC.amr" ApplicationName="VLC" ApplyOnUpgrade="true" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null

    $findstring    = '<Association Identifier=".avi" ProgId="AppX6eg8h5sxqq90pv53845wmnbewywdqq5h" ApplicationName="Movies &amp; TV" ApplyOnUpgrade="true" OverwriteIfProgIdIs="AppXhjhjmgrfm2d7rd026az898dy2p1pcsyt;WMP11.AssocFile.AVI" />'
    $replacestring = '<Association Identifier=".avi" ProgId="VLC.avi" ApplicationName="VLC" ApplyOnUpgrade="true" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null

    $findstring    = '<Association Identifier=".flac" ProgId="AppXqj98qxeaynz6dv4459ayz6bnqxbyaqcs" ApplicationName="Music" ApplyOnUpgrade="true" />'
    $replacestring = '<Association Identifier=".flac" ProgId="VLC.flac" ApplicationName="VLC" ApplyOnUpgrade="true" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null

    $findstring    = '<Association Identifier=".m2t" ProgId="AppX6eg8h5sxqq90pv53845wmnbewywdqq5h" ApplicationName="Movies &amp; TV" ApplyOnUpgrade="true" OverwriteIfProgIdIs="WMP11.AssocFile.M2TS" />'
    $replacestring = '<Association Identifier=".m2t" ProgId="VLC.m2t" ApplicationName="VLC" ApplyOnUpgrade="true" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null

    $findstring    = '<Association Identifier=".m2ts" ProgId="AppX6eg8h5sxqq90pv53845wmnbewywdqq5h" ApplicationName="Movies &amp; TV" ApplyOnUpgrade="true" OverwriteIfProgIdIs="WMP11.AssocFile.M2TS" />'
    $replacestring = '<Association Identifier=".m2ts" ProgId="VLC.m2ts" ApplicationName="VLC" ApplyOnUpgrade="true" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null

    $findstring    = '<Association Identifier=".m3u" ProgId="AppXqj98qxeaynz6dv4459ayz6bnqxbyaqcs" ApplicationName="Music" ApplyOnUpgrade="true" />'
    $replacestring = '<Association Identifier=".m3u" ProgId="VLC.m3u" ApplicationName="VLC" ApplyOnUpgrade="true" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null

    $findstring    = '<Association Identifier=".m4a" ProgId="AppXqj98qxeaynz6dv4459ayz6bnqxbyaqcs" ApplicationName="Music" ApplyOnUpgrade="true" OverwriteIfProgIdIs="WMP11.AssocFile.M4A" />'
    $replacestring = '<Association Identifier=".m4a" ProgId="VLC.m4a" ApplicationName="VLC" ApplyOnUpgrade="true" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null

    $findstring    = '<Association Identifier=".m4r" ProgId="AppXqj98qxeaynz6dv4459ayz6bnqxbyaqcs" ApplicationName="Music" ApplyOnUpgrade="true" />'
    $replacestring = '<Association Identifier=".m4r" ProgId="VLC.m4r" ApplicationName="VLC" ApplyOnUpgrade="true" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null

    $findstring    = '<Association Identifier=".m4v" ProgId="AppX6eg8h5sxqq90pv53845wmnbewywdqq5h" ApplicationName="Movies &amp; TV" ApplyOnUpgrade="true" OverwriteIfProgIdIs="AppXhjhjmgrfm2d7rd026az898dy2p1pcsyt;WMP11.AssocFile.MP4"/>'
    $replacestring = '<Association Identifier=".m4v" ProgId="VLC.m4v" ApplicationName="VLC" ApplyOnUpgrade="true" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null

    $findstring    = '<Association Identifier=".mka" ProgId="AppXqj98qxeaynz6dv4459ayz6bnqxbyaqcs" ApplicationName="Music" ApplyOnUpgrade="true" OverwriteIfProgIdIs="WMP11.AssocFile.MKA"/>'
    $replacestring = '<Association Identifier=".mka" ProgId="VLC.mka" ApplicationName="VLC" ApplyOnUpgrade="true" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null

    $findstring    = '<Association Identifier=".mkv" ProgId="AppX6eg8h5sxqq90pv53845wmnbewywdqq5h" ApplicationName="Movies &amp; TV" ApplyOnUpgrade="true" />'
    $replacestring = '<Association Identifier=".mkv" ProgId="VLC.mkv" ApplicationName="VLC" ApplyOnUpgrade="true" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null

    $findstring    = '<Association Identifier=".mod" ProgId="AppX6eg8h5sxqq90pv53845wmnbewywdqq5h" ApplicationName="Movies &amp; TV" ApplyOnUpgrade="true" OverwriteIfProgIdIs="WMP11.AssocFile.MPEG" />'
    $replacestring = '<Association Identifier=".mod" ProgId="VLC.mod" ApplicationName="VLC" ApplyOnUpgrade="true" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null

    $findstring    = '<Association Identifier=".mov" ProgId="AppX6eg8h5sxqq90pv53845wmnbewywdqq5h" ApplicationName="Movies &amp; TV" ApplyOnUpgrade="true" OverwriteIfProgIdIs="AppXhjhjmgrfm2d7rd026az898dy2p1pcsyt;WMP11.AssocFile.MOV" />'
    $replacestring = '<Association Identifier=".mov" ProgId="VLC.mov" ApplicationName="VLC" ApplyOnUpgrade="true" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null

    $findstring    = '<Association Identifier=".ec3" ProgId="AppXqj98qxeaynz6dv4459ayz6bnqxbyaqcs" ApplicationName="Music" ApplyOnUpgrade="true" />'
    $replacestring = '<Association Identifier=".ec3" ProgId="VLC.ec3" ApplicationName="VLC" ApplyOnUpgrade="true" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null

    $findstring    = '<Association Identifier=".MP2" ProgId="WMP11.AssocFile.MP3" ApplicationName="Windows Media Player" />'
    $replacestring = '<Association Identifier=".MP2" ProgId="VLC.mp2" ApplicationName="VLC" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null

    $findstring    = '<Association Identifier=".mp3" ProgId="AppXqj98qxeaynz6dv4459ayz6bnqxbyaqcs" ApplicationName="Music" ApplyOnUpgrade="true" OverwriteIfProgIdIs="WMP11.AssocFile.MP3" />'
    $replacestring = '<Association Identifier=".mp3" ProgId="VLC.mp3" ApplicationName="VLC" ApplyOnUpgrade="true" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null

    $findstring    = '<Association Identifier=".mp4" ProgId="AppX6eg8h5sxqq90pv53845wmnbewywdqq5h" ApplicationName="Movies &amp; TV" ApplyOnUpgrade="true" OverwriteIfProgIdIs="AppXhjhjmgrfm2d7rd026az898dy2p1pcsyt;WMP11.AssocFile.MP4" />'
    $replacestring = '<Association Identifier=".mp4" ProgId="VLC.mp4" ApplicationName="VLC" ApplyOnUpgrade="true" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null

    $findstring    = '<Association Identifier=".mp4v" ProgId="AppX6eg8h5sxqq90pv53845wmnbewywdqq5h" ApplicationName="Movies &amp; TV" ApplyOnUpgrade="true" OverwriteIfProgIdIs="AppXhjhjmgrfm2d7rd026az898dy2p1pcsyt;WMP11.AssocFile.MP4" />'
    $replacestring = '<Association Identifier=".mp4v" ProgId="VLC.mp4v" ApplicationName="VLC" ApplyOnUpgrade="true" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null

    $findstring    = '<Association Identifier=".mpa" ProgId="AppXqj98qxeaynz6dv4459ayz6bnqxbyaqcs" ApplicationName="Music" ApplyOnUpgrade="true" OverwriteIfProgIdIs="WMP11.AssocFile.MPEG" />'
    $replacestring = '<Association Identifier=".mpa" ProgId="VLC.mpa" ApplicationName="VLC" ApplyOnUpgrade="true" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null

    $findstring    = '<Association Identifier=".MPE" ProgId="AppX6eg8h5sxqq90pv53845wmnbewywdqq5h" ApplicationName="Movies &amp; TV" ApplyOnUpgrade="true" OverwriteIfProgIdIs="WMP11.AssocFile.MPEG" />'
    $replacestring = '<Association Identifier=".MPE" ProgId="VLC.mpe" ApplicationName="VLC" ApplyOnUpgrade="true" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null

    $findstring    = '<Association Identifier=".mpeg" ProgId="AppX6eg8h5sxqq90pv53845wmnbewywdqq5h" ApplicationName="Movies &amp; TV" ApplyOnUpgrade="true" OverwriteIfProgIdIs="WMP11.AssocFile.MPEG" />'
    $replacestring = '<Association Identifier=".mpeg" ProgId="VLC.mpeg" ApplicationName="VLC" ApplyOnUpgrade="true" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null

    $findstring    = '<Association Identifier=".mpg" ProgId="AppX6eg8h5sxqq90pv53845wmnbewywdqq5h" ApplicationName="Movies &amp; TV" ApplyOnUpgrade="true" OverwriteIfProgIdIs="WMP11.AssocFile.MPEG" />'
    $replacestring = '<Association Identifier=".mpg" ProgId="VLC.mpg" ApplicationName="VLC" ApplyOnUpgrade="true" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null

    $findstring    = '<Association Identifier=".mpv2" ProgId="AppX6eg8h5sxqq90pv53845wmnbewywdqq5h" ApplicationName="Movies &amp; TV" ApplyOnUpgrade="true" OverwriteIfProgIdIs="WMP11.AssocFile.MPEG" />'
    $replacestring = '<Association Identifier=".mpv2" ProgId="VLC.mpv2" ApplicationName="VLC" ApplyOnUpgrade="true" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null

    $findstring    = '<Association Identifier=".mts" ProgId="AppX6eg8h5sxqq90pv53845wmnbewywdqq5h" ApplicationName="Movies &amp; TV" ApplyOnUpgrade="true" OverwriteIfProgIdIs="WMP11.AssocFile.M2TS" />'
    $replacestring = '<Association Identifier=".mts" ProgId="VLC.mts" ApplicationName="VLC" ApplyOnUpgrade="true" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null

    $findstring    = '<Association Identifier=".tod" ProgId="AppX6eg8h5sxqq90pv53845wmnbewywdqq5h" ApplicationName="Movies &amp; TV" ApplyOnUpgrade="true" />'
    $replacestring = '<Association Identifier=".tod" ProgId="VLC.tod" ApplicationName="VLC" ApplyOnUpgrade="true" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null

    $findstring    = '<Association Identifier=".TS" ProgId="AppX6eg8h5sxqq90pv53845wmnbewywdqq5h" ApplicationName="Movies &amp; TV" ApplyOnUpgrade="true" OverwriteIfProgIdIs="WMP11.AssocFile.TTS" />'
    $replacestring = '<Association Identifier=".TS" ProgId="VLC.ts" ApplicationName="VLC" ApplyOnUpgrade="true" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null

    $findstring    = '<Association Identifier=".TTS" ProgId="AppX6eg8h5sxqq90pv53845wmnbewywdqq5h" ApplicationName="Movies &amp; TV" ApplyOnUpgrade="true" OverwriteIfProgIdIs="WMP11.AssocFile.TTS" />'
    $replacestring = '<Association Identifier=".TTS" ProgId="VLC.tts" ApplicationName="VLC" ApplyOnUpgrade="true" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null

    $findstring    = '<Association Identifier=".wav" ProgId="AppXqj98qxeaynz6dv4459ayz6bnqxbyaqcs" ApplicationName="Music" ApplyOnUpgrade="true" OverwriteIfProgIdIs="WMP11.AssocFile.WAV" />'
    $replacestring = '<Association Identifier=".wav" ProgId="VLC.wav" ApplicationName="VLC" ApplyOnUpgrade="true" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null

    $findstring    = '<Association Identifier=".wm" ProgId="AppX6eg8h5sxqq90pv53845wmnbewywdqq5h" ApplicationName="Movies &amp; TV" ApplyOnUpgrade="true" OverwriteIfProgIdIs="AppXhjhjmgrfm2d7rd026az898dy2p1pcsyt;WMP11.AssocFile.ASF" />'
    $replacestring = '<Association Identifier=".wm" ProgId="VLC.wm" ApplicationName="VLC" ApplyOnUpgrade="true" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null

    $findstring    = '<Association Identifier=".wma" ProgId="AppXqj98qxeaynz6dv4459ayz6bnqxbyaqcs" ApplicationName="Music" ApplyOnUpgrade="true" OverwriteIfProgIdIs="WMP11.AssocFile.WMA" />'
    $replacestring = '<Association Identifier=".wma" ProgId="VLC.wma" ApplicationName="VLC" ApplyOnUpgrade="true" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null

    $findstring    = '<Association Identifier=".wmv" ProgId="AppX6eg8h5sxqq90pv53845wmnbewywdqq5h" ApplicationName="Movies &amp; TV" ApplyOnUpgrade="true" OverwriteIfProgIdIs="AppXhjhjmgrfm2d7rd026az898dy2p1pcsyt;WMP11.AssocFile.WMV" />'
    $replacestring = '<Association Identifier=".wmv" ProgId="VLC.wmv" ApplicationName="VLC" ApplyOnUpgrade="true" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null

    <# Not supported by VLC
    $findstring    = '<Association Identifier=".WPL" ProgId="AppXqj98qxeaynz6dv4459ayz6bnqxbyaqcs" ApplicationName="Music" ApplyOnUpgrade="true" OverwriteIfProgIdIs="WMP11.AssocFile.WPL" />'
    $replacestring = '<Association Identifier=".WPL" ProgId="AppXqj98qxeaynz6dv4459ayz6bnqxbyaqcs" ApplicationName="Music" ApplyOnUpgrade="true" OverwriteIfProgIdIs="WMP11.AssocFile.WPL" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null
    #>

    $findstring    = '<Association Identifier="mswindowsmusic" ProgId="AppXtggqqtcfspt6ks3fjzyfppwc05yxwtwy" ApplicationName="Music" ApplyOnUpgrade="true" />'
    $replacestring = '<Association Identifier="mswindowsmusic" ProgId="VLC.mswindowsmusic" ApplicationName="VLC" ApplyOnUpgrade="true" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null

    $findstring    = '<Association Identifier="mswindowsvideo" ProgId="AppX6w6n4f8xch1s3vzwf3af6bfe88qhxbza" ApplicationName="Movies &amp; TV" ApplyOnUpgrade="true" />'
    $replacestring = '<Association Identifier="mswindowsvideo" ProgId="VLC.mswindowsvideo" ApplicationName="VLC" ApplyOnUpgrade="true" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null

    $findstring    = '<Association Identifier=".zpl" ProgId="AppXqj98qxeaynz6dv4459ayz6bnqxbyaqcs" ApplicationName="Music" ApplyOnUpgrade="true" />'
    $replacestring = '<Association Identifier=".zpl" ProgId="VLC.zpl" ApplicationName="VLC" ApplyOnUpgrade="true" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null

    $findstring    = '<Association Identifier=".xvid" ProgId="AppX6eg8h5sxqq90pv53845wmnbewywdqq5h" ApplicationName="Movies &amp; TV" ApplyOnUpgrade="true" />'
    $replacestring = '<Association Identifier=".xvid" ProgId="VLC.xvid" ApplicationName="VLC" ApplyOnUpgrade="true" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null
    
    ##################
    #     Browser    #
    ##################
    $findstring    = '<Association Identifier=".epub" ProgId="AppXvepbp3z66accmsd0x877zbbxjctkpr6t" ApplicationName="Microsoft Edge" ApplyOnUpgrade="true" />'
    $replacestring = '<Association Identifier=".epub" ProgId="AppXvepbp3z66accmsd0x877zbbxjctkpr6t" ApplicationName="Microsoft Edge" ApplyOnUpgrade="true" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null

    $findstring    = '<Association Identifier=".htm" ProgId="AppX4hxtad77fbk3jkkeerkrm0ze94wjf3s9" ApplicationName="Microsoft Edge" ApplyOnUpgrade="true" OverwriteIfProgIdIs="AppX6k1pws1pa7jjhchyzw9jce3e6hg6vn8d" />'
    $replacestring = '<Association Identifier=".htm" ProgId="ChromeHTML" ApplicationName="Google Chrome" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null

    $findstring    = '<Association Identifier=".html" ProgId="AppX4hxtad77fbk3jkkeerkrm0ze94wjf3s9" ApplicationName="Microsoft Edge" ApplyOnUpgrade="true" OverwriteIfProgIdIs="AppX6k1pws1pa7jjhchyzw9jce3e6hg6vn8d" />'
    $replacestring = '<Association Identifier=".html" ProgId="ChromeHTML" ApplicationName="Google Chrome" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null

    $findstring    = '<Association Identifier="http" ProgId="AppXq0fevzme2pys62n3e0fbqa7peapykr8v" ApplicationName="Microsoft Edge" ApplyOnUpgrade="true" OverwriteIfProgIdIs="AppXehk712w0hx4w5b8k25kg808a9h84jamg" />'
    $replacestring = '<Association Identifier="http" ProgId="ChromeHTML" ApplicationName="Google Chrome" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null

    $findstring    = '<Association Identifier="https" ProgId="AppX90nv6nhay5n6a98fnetv7tpk64pp35es" ApplicationName="Microsoft Edge" ApplyOnUpgrade="true" OverwriteIfProgIdIs="AppXz8ws88f5y0y5nyrw1b3pj7xtm779tj2t" />'
    $replacestring = '<Association Identifier="https" ProgId="ChromeHTML" ApplicationName="Google Chrome" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null

    $findstring    = '<Association Identifier=".url" ProgId="IE.AssocFile.URL" ApplicationName="Internet Explorer" />'
    $replacestring = '<Association Identifier=".url" ProgId="IE.AssocFile.URL" ApplicationName="Google Chrome" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null

    $findstring    = '<Association Identifier=".website" ProgId="IE.AssocFile.WEBSITE" ApplicationName="Internet Explorer" />'
    $replacestring = '<Association Identifier=".website" ProgId="IE.AssocFile.WEBSITE" ApplicationName="Google Chrome" />'
    (get-content $filefullpath) | foreach-object {$_ -replace $findstring, $replacestring} | Set-Content $filefullpath
    $findstring    = $null
    $replacestring = $null
    
    }
Wait-Job -Name Job7

####################
# System hardening #
####################

# denyall by default
.\cmd /c netsh advfirewall set allprofiles firewallpolicy blockinbound,blockoutbound
.\cmd /c netsh advfirewall firewall delete rule all
# allow outbound
.\cmd /c netsh advfirewall firewall add rule name="Core Networking (HTTPS-Out)" dir=out action=allow protocol=TCP remoteport=443
.\cmd /c netsh advfirewall firewall add rule name="Core Networking (DNS-Out)" dir=out action=allow protocol=UDP remoteport=53 program="%systemroot%\system32\svchost.exe" service="dnscache"
.\cmd /c netsh advfirewall firewall add rule name="Core Networking (DHCP-Out)" dir=out action=allow protocol=UDP localport=68 remoteport=67 program="%systemroot%\system32\svchost.exe" service="dhcp"
# reset to default with
#.\cmd.exe /c netsh advfirewall reset

.\w10-security.ps1
cd secure
.\Default.cmd
