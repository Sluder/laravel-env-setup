
# --------------------------------------------
#          Laravel 5.4 Windows Setup
# --------------------------------------------


# ----- SETUP -----
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Write-Host "`n`n`n`n`n`n"
Write-Host " ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
Write-Host "|`t Laravel 5.4 Installation `t|"
Write-Host " ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`n"

<#

# ----- DOWNLOAD VIRTUALBOX v5.1.22 -----
Write-Host "Downloading VirtualBox v5.1.22 ..."
Invoke-WebRequest http://download.virtualbox.org/virtualbox/5.1.22/VirtualBox-5.1.22-115126-Win.exe -OutFile $PSScriptRoot\VirtualBox-Install.exe
Start-Process -FilePath "$PSScriptRoot\VirtualBox-Install.exe" -wait
Write-Host "`t- Finished"
Remove-Item -path $PSScriptRoot\VirtualBox-Install.exe


# ----- DOWNLOAD VAGRANT v1.9.5 -----
Write-Host "Downloading Vagrant v1.9.5 ..."
Invoke-WebRequest https://releases.hashicorp.com/vagrant/1.9.5/vagrant_1.9.5.msi -OutFile $PSScriptRoot\Vagrant-Install.msi
Start-Process -FilePath "$PSScriptRoot\Vagrant-Install.msi" -wait
Write-Host "`t- Finished"
Remove-Item -path $PSScriptRoot\Vagrant-Install.msi


# ----- DOWNLOAD GIT SHELL v2.12.0 -----
Write-Host "Downloading Git Shell v2.12.0 ..."
Invoke-WebRequest https://github.com/git-for-windows/git/releases/download/v2.13.0.windows.1/Git-2.13.0-32-bit.exe -OutFile $PSScriptRoot\Git-Install.exe
Start-Process -FilePath "$PSScriptRoot\Git-Install.exe" -wait
Write-Host "`t- Finished"
Remove-Item -path $PSScriptRoot\Git-Install.exe
#>
# ----- SETS UP DEVELOPMENT ENVIRONMENT
Write-Host "`nCreating Development directorys"
cd $env:USERPROFILE

# Get user email for SSH 
$email = Read-Host -Prompt 'Enter Omnispear email: '
C:\"Program Files (x86)"\Git\git-bash.exe 

#--ssh-keygen -t rsa -C $email 
pause

mkdir Development
cd Development
mkdir Projects

Write-Host "`nSetting up Homestead"
C:\"Program Files (x86)"\Git\bin\git clone https://github.com/laravel/homestead.git Homestead 
cd Homestead
C:\"Program Files (x86)"\Git\bin\git checkout v5.3.2

Write-Host "`nInializing Homestead`n"
./init.bat

# Send keys to select VirtualBox
$wsh = New-Object -ComObject WScript.Shell
$wsh.SendKeys('2')
$wsh.SendKeys('{ENTER}')

vagrant box add laravel/homestead 

vagrant up
vagrant ssh


# C:\Program Files\Oracle\VirtualBox\drivers\network install both .inf