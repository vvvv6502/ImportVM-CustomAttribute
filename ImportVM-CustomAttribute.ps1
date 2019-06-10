#Executable Script
$startdir = "D:\GitHubZone\ImportVM-CustomAttribute"
$importfile = "$startdir\vm-custom-attributes-adjustedforimport.csv"
 
$NewAttributes = Import-Csv $importfile -encoding default
 
ForEach ($vm in $NewAttributes){   
   Write-Host (get-date -uformat %I:%M:%S) "$vm •ø¶b∞ı¶Ê..." -ForegroundColor Green
   Set-Annotation -Entity (get-vm $vm.VM) -CustomAttribute $vm."AP" -Value $vm."AP Value" -confirm:$false
   Set-Annotation -Entity (get-vm $vm.VM) -CustomAttribute $vm."SP" -Value $vm."SP Value" -confirm:$false
   Set-Annotation -Entity (get-vm $vm.VM) -CustomAttribute $vm."Ê•≠Â?Á≥ªÁµ±?çÁ®±" -Value $vm."Ê•≠Â?Á≥ªÁµ±?çÁ®± Value" -confirm:$false
   Set-Annotation -Entity (get-vm $vm.VM) -CustomAttribute $vm."Ê•≠Â?Á≥ªÁµ±Á∑®Ë?" -Value $vm."Ê•≠Â?Á≥ªÁµ±Á∑®Ë? Value" -confirm:$false
   Set-Annotation -Entity (get-vm $vm.VM) -CustomAttribute $vm."Ê•≠Â?Á≥ªÁµ±Ë™™Ê?" -Value $vm."Ê•≠Â?Á≥ªÁµ±Ë™™Ê? Value" -confirm:$false
}

#Original Script
<#
$startdir = "D:\sjoerd"
$importfile = "$startdir\vm-custom-attributes-adjustedforimport.csv"
 
$NewAttributes = Import-Csv $importfile
 
ForEach ($vm in $NewAttributes){
   Write-Host (get-date -uformat %I:%M:%S) "$vm is being done now..." -ForegroundColor Green
   # Set-VM -vm $vm.Name -Notes $vm.Notes -Confirm:$false
   Set-CustomField -Entity (get-vm $vm.Name) -Name $vm.DR -Value $vm."DR Value" -confirm:$false
   Set-CustomField -Entity (get-vm $vm.Name) -Name $vm.DRStorage -Value $vm."DRStorage Value" -confirm:$false
   # Set-CustomField -Entity (get-vm $vm.Name) -Name $vm.Cluster -Value $vm."Cluster Value" -confirm:$false
   Set-CustomField -Entity (get-vm $vm.Name) -Name $vm."DataCatagory" -Value $vm."DataCatagory Value" -confirm:$false
}
#>

#Old Script
<#
#Import CSV file with encoding utf8
$NewAttribs = Import-Csv ".\exported-attributes-value.csv" -encoding utf8

foreach($line in $NewAttribs){
# if value is empty, skip it (just to have all the import go faster)
if( $line.FieldValue -ne "") {
Set-Annotation -Entity (Get-VM $line.VMName) -CustomAttribute $line.FieldKey -Value $line.FieldValue -confirm:$false
}
}
#>