<#
.Synopsis
   Returns the names of members of an SCCM collection
.DESCRIPTION
   Returns the names of members of an SCCM collection
.EXAMPLE
   Get-SCCMCollectionMemberNames 'Test Collection'
.EXAMPLE
   Get-SCCMCollectionMemberNames -CollectionName 'Test Collection' `
                             -SiteCode 'S1'
#>
Function Get-SCCMCollectionMemberNames
{
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory=$true,
                   Position=0)]
        [string]$CollectionName,

        # Param2 help description
        [Parameter(Mandatory=$false,
                   Position=1)]
        [string]$SiteCode = 'S1'
    )

    Try
    {
        Import-Module 'C:\Program Files (x86)\Microsoft Configuration Manager\AdminConsole\bin\ConfigurationManager.psd1' -ErrorAction Stop
        CD "$($SiteCode):" -ErrorAction Stop
        Get-CMCollectionMember -CollectionName $CollectionName -ErrorAction Stop | foreach { $_.Name } | Sort-Object
    }
    Catch
    {
        Write-Output $Error[0].Exception.Message
    }
}