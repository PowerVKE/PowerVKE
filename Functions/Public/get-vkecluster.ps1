Function get-vkecluster {

<#
    .SYNOPSIS
    Lists all VKE clusters
    
    .DESCRIPTION
    List all clusters
    
    .INPUTS

    .OUTPUTS
 
    .EXAMPLE
 
 #>

$btoken = "Bearer " + $Global:VKEConnection.APIToken.access_token  
[string]$uri = $Global:VKEConnection.Endpoint
[string]$org = $Global:VKEConnection.OrgId

try {

$cool_shit = (Invoke-WebRequest -Uri $uri/v1/orgs/$org/clusters -Method GET -ContentType "application/json" -UseBasicParsing -Headers @{"Authorization"=$btoken} | ConvertFrom-json)



     
    }
    catch [Exception]{

        throw

    }
    Write-Output $cool_shit.items
}
