#Import CSV file with encoding utf8
$NewAttribs = Import-Csv ".\exported-attributes-value.csv" -encoding utf8

foreach($line in $NewAttribs){
# if value is empty, skip it (just to have all the import go faster)
if( $line.FieldValue -ne "") {
Set-Annotation -Entity (Get-VM $line.VMName) -CustomAttribute $line.FieldKey -Value $line.FieldValue -confirm:$false
}
}
