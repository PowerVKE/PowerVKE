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

try {
$clusters = Invoke-WebRequest -Uri "$uri/v1/orgs/$Global:VKEConnection.OrgId/clusters" -Method GET -ContentType "application/json" -UseBasicParsing -Headers @{"Authorization"=$btoken} | ConvertFrom-json)
invoke
     
    }
    catch [Exception]{

        throw

    }
    Write-Output $clusters.items
}
