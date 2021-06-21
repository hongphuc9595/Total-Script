#Import CSV
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") 
$FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{ 
    InitialDirectory = [Environment]::GetFolderPath('Desktop') 
    Filter = 'Comma-separated values (*.csv)|*.csv'
}
$FileBrowser.ShowDialog()
$csv= Import-Csv $FileBrowser.FileName

#####
ForEach ($file in $csv) {
$UPN= $file.userprinciplename
$immuid=$file.immutableid
Set-MsolUser -UserPrincipalName $upn -ImmutableId $immuid
}