<#
.DESCRIPTION
Simple function that returns true if device is a laptop

Dependent on WMI property for system enclosure being set to a chasis type that's a laptop

#>


Function Get-Laptop
{
 Param(
 [string]$computer = “localhost”
 )
 $isLaptop = $false
 if(Get-WmiObject -Class win32_systemenclosure -ComputerName $computer |
    Where-Object { $_.chassistypes -eq 9 -or $_.chassistypes -eq 10 `
    -or $_.chassistypes -eq 14})
   { $isLaptop = $true }
 if(Get-WmiObject -Class win32_battery -ComputerName $computer)
   { $isLaptop = $true }
 $isLaptop
}
