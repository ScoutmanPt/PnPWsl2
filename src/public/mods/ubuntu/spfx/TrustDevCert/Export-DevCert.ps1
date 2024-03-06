param(
    [string]$certPath
)
Write-Host "Exporting-DevCert Start ..`n"
$certStore = "Cert:\LocalMachine\Root"
Import-Certificate -FilePath $certPath -CertStoreLocation $certStore
Write-Host "`nExporting-DevCert End .."
Write-Host "`nDev Certificated imported to your host ! `n"
Write-Host "Press [Enter] to continue"
Read-Host 