# Windows Laravel Development Environment
Solved the issue of running into multiple issues setting up a developer with a Laravel development setup

### What it does : 
1. Downloads all required programs and installs
	* VirtualBox `v5.2.8`
	* Vagrant `v2.0.2`
	* Git `v2.12`
2. Creates development folders under under `~/Development` for convenience
	* `~/Development/Homestead` : Local Homestead server container
	* `~/Development/Projects` : Laravel projects container
3. Sets up Homestead and SSH keys for GIT
	* Prompts for email, might want to use one attached to your github.com

### Running :
Right click `Laravel-Setup.ps1` and select `Run with Powershell` (Might need admin privileges). 
Do not reboot while the script is running!
