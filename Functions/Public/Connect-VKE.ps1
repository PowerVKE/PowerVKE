
Function Connect-VKE {

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
        [String]$Endpoint="https://api.vke.cloud.vmware.com/",

        [parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [String]$Token,

        [parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [String]$OrgId  
    )    

Get-CSPAccessToken -RefreshToken $Token 

try {
    $VKE_AUTH_ENDPOINT = (Invoke-WebRequest -Method GET -Uri https://$Endpoint/v1/system/auth | ConvertFrom-Json) 
    $VKE_AUTH_ENDPOINTv2 = $VKE_AUTH_ENDPOINT.endpoint
    $VKE_TOKEN_ENDPOINT = (Invoke-WebRequest -Method GET $VKE_AUTH_ENDPOINTv2/openidconnect/$OrgId/.well-known/openid-configuration | ConvertFrom-Json)                          
    $VKE_TOKEN_ENDPOINTv2 = $VKE_TOKEN_ENDPOINT.token_endpoint 
    $CSP_ACCESS_TOKEN = $env:cspAuthToken
    $VKE_ACCESS_TOKEN = (Invoke-RestMethod -ContentType "application/x-www-form-urlencoded" -Method POST -Body "grant_type=urn:vmware:grant_type:federation_token&access_token=${CSP_ACCESS_TOKEN}&scope=openid offline_access rs_admin_server at_groups id_groups rs_vmdir" -Uri $VKE_TOKEN_ENDPOINTv2)


        $Global:VKEConnection = [PSCustomObject] @{
            Endpoint = $Endpoint
            APIToken = $VKE_ACCESS_TOKEN
            OrgId = $OrgId
        }

     
    }
    catch [Exception]{

        throw

    }
    Write-Output "Connected." $VKEConnection
}