Set-StrictMode -Version 3
$ErrorActionPreference = "Stop"

Uninstall-Module -Name PnP.Wsl2 -Force -ErrorAction SilentlyContinue

$repoName = 'LocalPSRepo'
Get-PSRepository -Name LocalPSRepo |Unregister-PSRepository    

$fileShareLocation = 'C:\work\psrepo\'
Remove-Item -Path $fileShareLocation -Recurse -Force
New-Item -Path $fileShareLocation -ItemType Directory -Force

Register-PSRepository -Name $repoName -SourceLocation $fileShareLocation `
                    -PublishLocation $fileShareLocation -InstallationPolicy Trusted

Publish-Module -Name "$PSScriptRoot\..\src\PnP.Wsl2.psd1" -Repository LocalPSRepo -NuGetApiKey "1234" -Verbose
