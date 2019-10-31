#Requires -Version 5.0

#Define DSC Configuration
Configuration VaronisDSP
{
    param
    (
        [string[]]$ComputerName='localhost'
    )

    Import-DscResource -ModuleName 'PSDesiredStateConfiguration'
    Import-DscResource -ModuleName 'cChoco'
    Import-DscResource -ModuleName 'ComputerManagementDsc'

    Node $ComputerName
    {
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

       WindowsFeature NET-Framework-Core
       {
           Ensure = 'Present'
           Name = "NET-Framework-Core"
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
    Name = "corretto8jdk"
    DependsOn = "[cChocoInstaller]installChoco"
    }
  }
}

#Create directory for MOF file
New-Item -ItemType "directory" -Path "C:\Varonis\DSC"

#Run configuration and create MOF file
VaronisDSP -OutputPath C:\Varonis\DSC

#Configure the machine
Start-DscConfiguration -Path "C:\Varonis\DSC" -Wait -Force