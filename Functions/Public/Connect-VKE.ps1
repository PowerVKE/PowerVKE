function Connect-VKE {

<#
    .SYNOPSIS
    Connect to VMware VKE API Endpoint
    
    .DESCRIPTION
    Connect to VMware VKE API Endpoint VMware Cloud Services and recieve an API token. 
    
    .PARAMETER Endpoint
    VKE Endpoint to connect to.
    
    .PARAMETER Token
    Refresh Token for VKE.

    .PARAMETER OrgId
    Organisation ID for the VKE instance.
    
    .INPUTS
    System.String

    .OUTPUTS
 
    .EXAMPLE
 
 #>

[CmdletBinding(DefaultParametersetName="Token")][OutputType('System.Management.Automation.PSObject')]

    Param (

        [parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [String]$Endpoint,

        [parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [String]$Token,

        [parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [String]$OrgId  
    )
}