#Requires -Version 5.0

#Define contents of install notes file
$FileContents = "Install Date - $(Get-Date)" +([Environment]::NewLine) + "SE Name - John Giglio jgiglio@varonis.com" + ([Environment]::NewLine) + "Key - " + ([Environment]::NewLine) + "CustID - "

#Define DSC Configuration
Configuration VaronisDSP
{
    param
    (
        [string[]]$ComputerName='localhost',
    
        [string[]]$VaronisDir='C:\Varonis'
    )

    Import-DscResource -ModuleName 'PSDesiredStateConfiguration'
    Import-DscResource -ModuleName 'cChoco'
    Import-DscResource -ModuleName 'ComputerManagementDsc'

    Node $ComputerName
    {
        File VaronisReports {
            Type = "directory"
            DestinationPath = "$VaronisDir\Reports"
            Ensure = "Present"
           }
        File VaronisLogs {
            Type = "directory"
            DestinationPath = "$VaronisDir\Logs"
            Ensure = "Present"
           }
        File DLS {
            Type = "directory"
            DestinationPath = "$VaronisDir\DLS"
            Ensure = "Present"
           }
        File DA {
            Type = "directory"
            DestinationPath = "$VaronisDir\DA"
            Ensure = "Present"
           }
           File InstallNotes {
            Type = "file"
            DestinationPath = "$VaronisDir\InstallNotes.txt"
            Ensure = "Present"
            Contents = "$FileContents"
            DependsOn = "[File]VaronisReports"
           }
           
           PowerPlan SetPlanHighPerformance {
             IsSingleInstance = 'Yes'
             Name             = 'High performance'
           }
           
           Registry DisableUAC {

            Ensure = "Present"
    
            Key = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
    
            ValueName = "EnableLUA"
    
            ValueData = "0"
    
            ValueType = "Dword" 
            }

        WindowsFeature Web-Server
    {
        Ensure = 'Present'
        Name = "Web-Server"
    }
        WindowsFeature Web-WebServer
    {
        Ensure = 'Present'
        Name = "Web-WebServer"
    }
        WindowsFeature Web-Common-Http
    {
        Ensure = 'Present'
        Name = "Web-Common-Http"
    }
        WindowsFeature Web-Default-Doc
    {
        Ensure = 'Present'
        Name = "Web-Default-Doc"
    }
        WindowsFeature Web-Dir-Browsing
    {
        Ensure = 'Present'
        Name = "Web-Dir-Browsing"
    }
        WindowsFeature Web-Http-Errors
    {
        Ensure = 'Present'
        Name = "Web-Http-Errors"
    }
        WindowsFeature Web-Static-Content
    {
        Ensure = 'Present'
        Name = "Web-Static-Content"
    }
        WindowsFeature Web-Http-Redirect
    {
        Ensure = 'Present'
        Name = "Web-Http-Redirect"
    }
        WindowsFeature Web-Health
    {
        Ensure = 'Present'
        Name = "Web-Health"
    }
        WindowsFeature Web-Http-Logging
    {
        Ensure = 'Present'
        Name = "Web-Http-Logging"
    }
        WindowsFeature Web-Performance
    {
        Ensure = 'Present'
        Name = "Web-Performance"
    }
        WindowsFeature Web-Stat-Compression
    {
        Ensure = 'Present'
        Name = "Web-Stat-Compression"
    }
        WindowsFeature Web-Security
    {
        Ensure = 'Present'
        Name = "Web-Security"
    }
        WindowsFeature Web-Filtering
    {
        Ensure = 'Present'
        Name = "Web-Filtering"
    }
        WindowsFeature Web-Basic-Auth
    {
        Ensure = 'Present'
        Name = "Web-Basic-Auth"
    }
        WindowsFeature Web-Windows-Auth
    {
        Ensure = 'Present'
        Name = "Web-Windows-Auth"
    }
        WindowsFeature Web-App-Dev
    {
        Ensure = 'Present'
        Name = "Web-App-Dev"
    }
        WindowsFeature Web-Net-Ext
    {
        Ensure = 'Present'
        Name = "Web-Net-Ext"
    }
        WindowsFeature Web-Net-Ext45
    {
        Ensure = 'Present'
        Name = "Web-Net-Ext45"
    }
        WindowsFeature Web-Asp-Net
    {
        Ensure = 'Present'
        Name = "Web-Asp-Net"
    }
        WindowsFeature Web-Asp-Net45
    {
        Ensure = 'Present'
        Name = "Web-Asp-Net45"
    }
        WindowsFeature Web-ISAPI-Ext
    {
        Ensure = 'Present'
        Name = "Web-ISAPI-Ext"
    }
        WindowsFeature Web-ISAPI-Filter
    {
        Ensure = 'Present'
        Name = "Web-ISAPI-Filter"
    }
        WindowsFeature Web-Mgmt-Tools
    {
        Ensure = 'Present'
        Name = "Web-Mgmt-Tools"
    }
        WindowsFeature Web-Mgmt-Console
    {
        Ensure = 'Present'
        Name = "Web-Mgmt-Console"
    }
        WindowsFeature Web-Mgmt-Compat
    {
        Ensure = 'Present'
        Name = "Web-Mgmt-Compat"
    }
        WindowsFeature Web-Metabase
    {
        Ensure = 'Present'
        Name = "Web-Metabase"
    }
        WindowsFeature NET-Framework-Features
    {
        Ensure = 'Present'
        Name = "NET-Framework-Features"
    }
        WindowsFeature NET-Framework-Core
    {
        Ensure = 'Present'
        Name = "NET-Framework-Core"
    }
        WindowsFeature NET-HTTP-Activation
    {
        Ensure = 'Present'
        Name = "NET-HTTP-Activation"
    }
        WindowsFeature NET-Framework-45-Features
    {
        Ensure = 'Present'
        Name = "NET-Framework-45-Features"
    }
        WindowsFeature NET-Framework-45-Core
    {
        Ensure = 'Present'
        Name = "NET-Framework-45-Core"
    }
        WindowsFeature NET-Framework-45-ASPNET
    {
        Ensure = 'Present'
        Name = "NET-Framework-45-ASPNET"
    }
        WindowsFeature NET-WCF-Services45
    {
        Ensure = 'Present'
        Name = "NET-WCF-Services45"
    }
        WindowsFeature NET-WCF-HTTP-Activation45
    {
        Ensure = 'Present'
        Name = "NET-WCF-HTTP-Activation45"
    }
        WindowsFeature NET-WCF-TCP-PortSharing45
    {
        Ensure = 'Present'
        Name = "NET-WCF-TCP-PortSharing45"
    }
        WindowsFeature GPMC
    {
        Ensure = 'Present'
        Name = "GPMC"
    }
        WindowsFeature RSAT
    {
        Ensure = 'Present'
        Name = "RSAT"
    }
        WindowsFeature RSAT-Role-Tools
    {
        Ensure = 'Present'
        Name = "RSAT-Role-Tools"
    }
        WindowsFeature RSAT-AD-Tools
    {
        Ensure = 'Present'
        Name = "RSAT-AD-Tools"
    }
        WindowsFeature RSAT-AD-PowerShell
    {
        Ensure = 'Present'
        Name = "RSAT-AD-PowerShell"
    }
        WindowsFeature RSAT-ADDS
    {
        Ensure = 'Present'
        Name = "RSAT-ADDS"
    }
        WindowsFeature RSAT-AD-AdminCenter
    {
        Ensure = 'Present'
        Name = "RSAT-AD-AdminCenter"
    }
        WindowsFeature RSAT-ADDS-Tools
    {
        Ensure = 'Present'
        Name = "RSAT-ADDS-Tools"
    }
        WindowsFeature WAS
    {
        Ensure = 'Present'
        Name = "WAS"
    }
        WindowsFeature WAS-Process-Model
    {
        Ensure = 'Present'
        Name = "WAS-Process-Model"
    }
        WindowsFeature WAS-NET-Environment
    {
        Ensure = 'Present'
        Name = "WAS-NET-Environment"
    }
        WindowsFeature WAS-Config-APIs
    {
        Ensure = 'Present'
        Name = "WAS-Config-APIs"
    }
        WindowsFeature WoW64-Support
    {
        Ensure = 'Present'
        Name = "WoW64-Support"
    }
# Install Chocolatey using cChoco module
    cChocoInstaller installChoco
    {
    InstallDir = "c:\choco"
    DependsOn = "[WindowsFeature]NET-Framework-Core"
    }
# Install JDK8
    cChocoPackageInstaller installJdk8
    {
    Name = "jdk8"
    DependsOn = "[cChocoInstaller]installChoco"
    }
#Install JRE8
    cChocoPackageInstaller installJre8
    {
    Name = "jre8"
    DependsOn = "[cChocoInstaller]installChoco"
    }
#Install Net472
    cChocoPackageInstaller dotnet472
    {
    Name = "dotnetfx"
    DependsOn = "[cChocoInstaller]installChoco","[cChocoPackageInstaller]kb2919355","[cChocoPackageInstaller]kb4019990"
    }
#Install kb4019990
   cChocoPackageInstaller kb4019990
   {
    Name = "kb4019990"
    DependsOn = "[cChocoInstaller]installChoco","[cChocoPackageInstaller]kb2919355"
    }
#Install kb2919355
    cChocoPackageInstaller kb2919355
    {
    Name = "kb2919355"
    DependsOn = "[cChocoInstaller]installChoco"
    }
  }
}

#Create directory for MOF file
New-Item -ItemType "directory" -Path "C:\Varonis\DSC"

#Run configuration and create MOF file
VaronisDSP -OutputPath C:\Varonis\DSC

#Configure the machine
Start-DscConfiguration -Path "C:\Varonis\DSC" -Wait -Verbose -Force