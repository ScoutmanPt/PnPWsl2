param(
    [string]$certPath
)
$certPath = $certPath.Replace("\","\\")
$certPath = (Get-Item -Path $certPath).FullName

Start-Process "pwsh.exe" -ArgumentList @("-File","$PSScriptRoot\Export-DevCert.ps1","-certPath","$certPath") -verb runAs
