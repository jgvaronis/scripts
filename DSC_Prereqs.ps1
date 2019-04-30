#Requires -Version 5.0

#Install NuGet and Chocolately
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force

Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force

Install-Module -Name cChoco -Force

Install-Module -Name ComputerManagementDSC -Force