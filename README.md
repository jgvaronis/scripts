This repo contains the DSC scripts you will need to configure the servers for Varonis. You’ll see that one is for the SOLR server and the other is for the DSP. There is also a prerequisite script which needs to be run first on each server, then the config script. 

**Please read this entire document before you start**

Assumptions:
•	Installs on the C: drive. (If you prefer to use a different drive, I can modify the script)
•	You are using Server 2016. (If you are using 2012R2, let me know)
•	Both servers have internet access
•	Both servers are up to date on OS patches
•	Both servers have powershell version 5 or greater installed (You can run $PSVersionTable in a powershell window to verify)

DSP/SQL Server

•	Download Varonis (SQL Server and Mgt studio are also out on the download site if you need them)
•	Run Prereq script
•	Run the 2016DSC.ps1 script (Takes about 30 minutes to complete, server should reboot after completion)
•	Install SQL Server and be sure to include SQL reporting services and SQL Management Studio
•	The script will create 2 directories that need to be shared, one called DA and the other called DLS. Share both of those folders and grant ‘Full control’ permissions to the Varonis Service account and the local SYSTEM account. 
•	Run the Varonis setup.exe from the Installer directory (Make sure SOLR server is ready first)


SOLR Server

•	Run Prereq script
•	Run 2016SOLR.ps1 script (Takes about 30 minutes to complete, server should reboot after completion)
