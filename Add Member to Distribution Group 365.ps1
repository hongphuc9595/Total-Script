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
ForEach ($object in $csv) {
$UPN= $object.Member
$Group= $object.GroupName
Add-DistributionGroupMember -Identity $Group -Member $UPN
Write-Host -f Green "Added Member '$upn' to Group '$Group'"
}