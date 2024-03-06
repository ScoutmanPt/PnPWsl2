$results = Invoke-ScriptAnalyzer -Path $PSScriptRoot\..\src\public\*.ps1 -ExcludeRule PSAvoidUsingInvokeExpression,PSShouldProcess,PSUseShouldProcessForStateChangingFunctions -Recurse 
$results>$PSScriptRoot\report.txt
