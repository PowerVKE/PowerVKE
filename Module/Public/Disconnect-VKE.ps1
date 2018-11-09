function Disconnect-VKE {

<#
    .SYNOPSIS
    Disconnect from a VKE Endpoint
    .DESCRIPTION
    Disconnect from a VKE Endpoint by removing the authorization token and the global VKEConnection variable from PowerShell
    .EXAMPLE
    Disconnect-VKE
    .EXAMPLE
    Disconnect-VKE -Confirm:$false
#>

[CmdletBinding(SupportsShouldProcess,ConfirmImpact="High")]

    Param ()

    # --- Test for existing connection to VKE

    if (-not $Global:VKEConnection){

        throw "VKE Connection variable does not exist. Please run Connect-VKEConnection first to create it"
    }
}