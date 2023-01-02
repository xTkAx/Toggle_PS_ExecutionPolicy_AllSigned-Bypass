#Requires -RunAsAdministrator
#Requires -Version 3

<#
# Toggle_PS_ExecutionPolicy_AllSigned_and_Bypass.ps1
  --------------------------------------------------

### PURPOSE:
  
    A script to swap between default "AllSigned" execution policy and "Bypass"
        -"Bypass"    = used for quick script dev and better debugging in ISE.
        -"AllSigned" = used for the best safety (not safe to keep "Bypass" always on!)

### REQUIRES:

    **Run As Administrator**
#>

Write-Host "Current ExecutionPolicy: '$((ExecutionPolicy).ToString().Trim())'"
if ($(ExecutionPolicy).ToString().Trim() -eq "AllSigned")
{
    try
    {
        Set-ExecutionPolicy -ExecutionPolicy Bypass -Force -ErrorAction Stop
        
        Write-Host "ExecutionPolicy set to : '$((ExecutionPolicy).ToString().Trim())'"
    }
    catch
    {
        Write-Host $_ -ForegroundColor Red
    }
}
elseif ($(ExecutionPolicy).ToString().Trim() -eq "Bypass")
{
    try
    {
        Set-ExecutionPolicy -ExecutionPolicy AllSigned -Force -ErrorAction Stop
        
        Write-Host "ExecutionPolicy set to : '$((ExecutionPolicy).ToString().Trim())'"
    }
    catch
    {
        Write-Host $_ -ForegroundColor Red
    }
}
else
{
    Write-Host "Did nothing for unhandled policy: '$((ExecutionPolicy).ToString().Trim())'"

    Write Host "try run 'Set-ExecutionPolicy -ExecutionPolicy AllSigned' first"
}