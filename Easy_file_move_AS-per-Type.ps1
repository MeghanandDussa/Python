$file_types=Get-ChildItem 'C:\Users\SPACex\Pictures\POCO_F1@17022020' -Recurse | Select-Object -Property Extension -Unique | Where-Object{$_.Extension -ne ""}

foreach($fltype in $file_types.Extension){
$fldrnme= $fltype.ToString().split(".")[1];
if((Test-Path C:\Users\SPACex\Pictures\POCO_F1@17022020\FIles_As_per_Types\$fldrnme) -eq $false){
New-Item -Path 'C:\Users\SPACex\Pictures\POCO_F1@17022020\FIles_As_per_Types\' -Name $fltype.ToString().split(".")[1] -ItemType Directory -Force -Verbose
}

Get-ChildItem 'C:\Users\SPACex\Pictures\POCO_F1@17022020\' -Recurse | Where-Object{$_.Extension -match $fltype}| Move-Item -Destination C:\Users\SPACex\Pictures\POCO_F1@17022020\FIles_As_per_Types\$fldrnme\ -Verbose
#Get-ChildItem C:\Users\SPACex\Pictures\POCO_F1@17022020\FIles_As_per_Types\$fldrnme\
}

<#foreach($fltype in $file_types.Extension){
$fldrnme= $fltype.ToString().split(".")[1];
Get-ChildItem 'C:\Users\SPACex\Pictures\POCO_F1@17022020\Downloads' | Where-Object{$_.Extension -match $fltype}| Move-Item -Destination E:\"Dubai Vacation"\"Apple_All_PhotosVideos"\$fldrnme\

}#>