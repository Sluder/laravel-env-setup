
# --------------------------------------------
#  Laravel Windows Environment Setup
# --------------------------------------------

# Pre-setup 
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$wsh = New-Object -ComObject WScript.Shell

Write-Host " ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
Write-Host "|`t  Laravel Installation  `t|"
Write-Host " ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`n"
Write-Host "`n`n`n`n`n"

# Download and install Virtualbox v5.1.22
Write-Host "Downloading VirtualBox v5.1.22 ..."
Invoke-WebRequest http://download.virtualbox.org/virtualbox/5.2.8/VirtualBox-5.2.8-121009-Win.exe -OutFile $PSScriptRoot\VirtualBox-Install.exe
Start-Process -FilePath "$PSScriptRoot\VirtualBox-Install.exe" -wait

Write-Host "`t- Finished"
Remove-Item -path $PSScriptRoot\VirtualBox-Install.exe


# Download and install Vagrant v1.9.5
Write-Host "Downloading Vagrant v1.9.5 ..."
Invoke-WebRequest https://releases.hashicorp.com/vagrant/2.0.2/vagrant_2.0.2_x86_64.msi -OutFile $PSScriptRoot\Vagrant-Install.msi
Start-Process -FilePath "$PSScriptRoot\Vagrant-Install.msi" -wait

Write-Host "`t- Finished"
Remove-Item -path $PSScriptRoot\Vagrant-Install.msi


# Download and install Git v2.12.0
Write-Host "Downloading Git Shell v2.12.0 ..."
Invoke-WebRequest https://github.com/git-for-windows/git/releases/download/v2.13.0.windows.1/Git-2.13.0-32-bit.exe -OutFile $PSScriptRoot\Git-Install.exe
Start-Process -FilePath "$PSScriptRoot\Git-Install.exe" -wait

Write-Host "`t- Finished"
Remove-Item -path $PSScriptRoot\Git-Install.exe


# Set up development folders 
$email = Read-Host -Prompt 'Enter email: '

$wsh.SendKeys('{ENTER}')
$wsh.SendKeys('{ENTER}')
$wsh.SendKeys('{ENTER}')
C:\"Program Files (x86)"\Git\bin\sh.exe --login -i -c "ssh-keygen -t rsa -C $email" 

Write-Host "`nCreating Development directorys"
cd $env:USERPROFILE

mkdir Development
cd Development
mkdir Projects


# Homestead setup
Write-Host "`nSetting up Homestead"
C:\"Program Files (x86)"\Git\bin\git clone https://github.com/laravel/homestead.git Homestead 
cd Homestead
C:\"Program Files (x86)"\Git\bin\git checkout v5.3.2

Write-Host "`nInializing Homestead`n"
./init.bat

$wsh.SendKeys('3')
$wsh.SendKeys('{ENTER}')

C:\HashiCorp\Vagrant\bin\vagrant box add laravel/homestead 

C:\HashiCorp\Vagrant\bin\vagrant up
C:\HashiCorp\Vagrant\bin\vagrant ssh

Write-Host "`n`nLaravel environment setup is complete"
cmd /c pause | out-null

# VirtualBox network drivers : C:\Program Files\Oracle\VirtualBox\drivers\network install both .inf
# Pause script : cmd /c pause | out-null
