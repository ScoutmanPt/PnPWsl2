# Importing required modules
using module ./private/PnPWsl2Helpers.psm1
using module ./private/PSScreens.psm1

Set-StrictMode -Version Latest
## Telemetry send module loaded + version

# get current module version loading pnp.wsl.psd1
# Import the .psd1 file
$moduleData = Import-PowerShellDataFile -Path $PSScriptRoot/PnP.Wsl2.psd1
# Get the module version
$env:PRODUCT_NAME = "PnP.Wsl2"
$env:PNPWSL2_VERSION = $moduleData.ModuleVersion
$env:PNPWSL2_APPI_ENDPOINT= $moduleData.PrivateData.Constants.AppInsightsIngestionEndpoint
$env:PNPWSL2_APPI_INSTRKEY =  $moduleData.PrivateData.Constants.AppInsightsInstrumentationKey
$env:PNPWSL2_TELEMETRY_INSTANCE = ([guid]::NewGuid().ToString("N"))
$env:PNPWSL2_TELEMETRY_ISON = $true

Send-PnPWsl2TrackEventTelemetry -EventName "Import-Module" 

# Get and private function definition files
$public = @(Get-ChildItem -Path "$PSScriptRoot\Public\*.ps1" -Exclude "*.Tests.*" -ErrorAction SilentlyContinue)
# Importing all functions
foreach ($import in $public) {
    try {
        Write-Verbose "Importing $($import.FullName)..."
        . $import.FullName
    }
    catch {
        Write-Error "Failed to import function $($import.FullName): $_"
    }
}
Initialize-ModuleConfiguration 
Export-ModuleMember -Function $public.BaseName

# SIG # Begin signature block
# MIIFkgYJKoZIhvcNAQcCoIIFgzCCBX8CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCAz6ddZ8sQSLiiB
# xxvGK6WtWIIGSpRWmPORkutpvGWlU6CCAw8wggMLMIIB86ADAgECAhBjA+rN0uPE
# jUpYQc9R01NPMA0GCSqGSIb3DQEBBQUAMBMxETAPBgNVBAMMCFBuUC5Xc2wyMB4X
# DTI0MDMwNTE2NTI1M1oXDTI1MDMwNTE3MTI1M1owEzERMA8GA1UEAwwIUG5QLldz
# bDIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDn252PPDHHBPB++tdP
# sGbnqHVf88DDtQ6lu5Q/d8AbxP3y1uDor4xnXzblM/gTq4f1o0xs8TCtvpXKTObO
# N5oitqNwvTjkAMuNeWNirrPBY2xuUWPmuaHhgW+80JpT17ygDVJgdb0hL5GH3InD
# k/9H8oLDh9Fu313F6+qUffu5qWCPPaE2BlcpZg/Al04q9/JKLnM7Lnd9GQn/BPzB
# Uf1GSeOlYHlRYkSAoL+dV1WZjUYvb3nX919pZ2rMIEEAXZGB2+I1Qt09H68Mlwv6
# ZATzTLvKkHwfTd3M6ENrgXANhXwhESCcZErY+QBh5kobl7/vGqWxjZF/sLJ8i9KD
# Wb3dAgMBAAGjWzBZMA4GA1UdDwEB/wQEAwIHgDATBgNVHSUEDDAKBggrBgEFBQcD
# AzATBgNVHREEDDAKgghQblAuV3NsMjAdBgNVHQ4EFgQUUjlKfLpgsuGwW3/pmdnx
# TjYWVJQwDQYJKoZIhvcNAQEFBQADggEBANaWmHud9DM/a8CnLqLPEMaCvBAW0OCR
# UUYCAXHiIFaZspQ1MNQkywAD8y+3RO+wcdyZ4H9dMBkpOm4X7/UD6KqXm7lO0nhy
# mvPhKquZrELWzoaY2OopSDHKtChYabpLK9uY2F22tH6NttdBT3tD+65a088k00t8
# CBxi7YAw+3owsgpb0s9MQYlwIHaSjLj5l31DkCRlPrCP+gmGM04zE3XZlBeDMFtn
# 9ZmekoQIY52xt8O66aBPjlTh6vGfeo9P4npoLk9IiY0bTqdm7zizI+pc9rEHFPb+
# 5aVvzBkMPbA0Bkzs0jFi5qvnCbOZCEhYlSAj63ey+/R3N0/jxGrprxcxggHZMIIB
# 1QIBATAnMBMxETAPBgNVBAMMCFBuUC5Xc2wyAhBjA+rN0uPEjUpYQc9R01NPMA0G
# CWCGSAFlAwQCAQUAoIGEMBgGCisGAQQBgjcCAQwxCjAIoAKAAKECgAAwGQYJKoZI
# hvcNAQkDMQwGCisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcC
# ARUwLwYJKoZIhvcNAQkEMSIEIL0NiiwfW07C2V6UTDTVfdu/XuAjh975NTUFHTSv
# tnbmMA0GCSqGSIb3DQEBAQUABIIBAD/X8pseo1VxKp2rJRrJP21uXgvQaEVcQRvH
# QZH168aejjDxp9cyuK1nxWo27sCqRVyxzOtX5qB23it4I9n1Gbu+l41mBLCzMmah
# gaYdyLZsSaHHt0OSLLTGFBI4OSIwSIhdJIOlDfJ2XlxxlTN8LZC7dSE3HKUM9QSx
# t+dmoBS9h3K80hmN+j+hU4tpobq4t5V9X+fxuZl7a8XEcT6BPv9SoF74wSBeJCl/
# /wdUMuRC8/fGLmRSS5VkiF6z41psjegWDFBGw59SZsZeUpwRbHCOrMAhNMxxRbwC
# PBgc0tkb/i/WEDGHGjzRFNbiKCxAWhiXGN4b2eQzrvhW3PsCqHA=
# SIG # End signature block
