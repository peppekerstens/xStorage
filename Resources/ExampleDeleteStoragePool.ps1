Configuration StorageSpaces
{

    Import-DSCResource -ModuleName xStorage

    StoragePool SP_Test
    {
        FriendlyName = 'SP_Test'
        Ensure = 'Absent'
    }
}

$MOFPath = 'C:\MOF'
If (!(Test-Path $MOFPath)){New-Item -Path $MOFPath -ItemType Directory}
StorageSpaces -OutputPath $MOFPath
Start-DscConfiguration -Path $MOFPath -Wait -Force -Verbose