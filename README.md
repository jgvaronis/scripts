Thanks for your time today- we enjoyed the conversation! As discussed, the attached document contains the technical requirements for the Varonis evaluation servers and permissions needed.
 
The attached zip folder contains the DSC scripts you will need to configure the servers once they are built. You’ll see that one is for the DSP server and the other is for the SOLR server. There is also a prerequisite script which needs to be run first on each server, then the config script. 

*Note* Due to email filters sometimes stripping the file, you will need to rename the files from .txt to .ps1
 
Please read this entire email before you start
 
Assumptions: 
•	Installs on the C: drive. (If you prefer to use a different drive, I can modify the script)
•	You are using Server 2016. (If you are using 2012R2, please let me know)
•	Both servers have internet access 
•	Both servers are up to date on OS patches
•	Both servers have powershell version 5 or greater installed (You can run $PSVersionTable in a powershell window to verify)
•	The scripts are run from an elevated console
 
DSP/SQL Server
•	Download Varonis (SQL Server and Mgt studio are also out on the download site if you need them) 
•	Run DSC_Prereqs.ps1 script
•	Run the 2016_DSP_Server.ps1 script (Takes approx 30 minutes to complete, server should reboot after completion. Reboot manually if needed) 
•	Install SQL Server and be sure to include SQL reporting services and SQL Management Studio
 
SOLR Server
•	Run DSC_Prereqs.ps1 script
•	Run SOLR_Server.ps1 script (Takes about 30 minutes to complete, server should reboot after completion. Reboot manually if needed)
 
Please let me know if you have any questions, looking forward to working with you! 
