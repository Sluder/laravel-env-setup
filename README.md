# Windows Laravel Development Environment
Solved the problem of running into multiple issues setting up a developer with a Laravel development setup. Mainly caused by incompatible packages trying to work with eachother. 

### What it does : 
1. Downloads & sets up all required programs 
	* VirtualBox `v5.2.8`
	* Vagrant `v2.0.2`
	* Git `v2.12`
	* Homestead `Latest`
2. Creates development folders under under `~/Development` for convenience
	* `~/Development/Homestead` : Local Homestead server container
	* `~/Development/Projects` : Laravel projects container
3. Sets up Homestead and SSH keys for Git
	* Prompts for email, might want to use one attached to your github.com

### Running :
Right click `Laravel-Setup.ps1` and select `Run with Powershell` (Might need admin privileges). 


### Notes : 
* If prompted "The execution policy helps protect you from scripts that you do not trust", select choice `A` for "Yes to All". 
* Do not reboot while the script is running!
