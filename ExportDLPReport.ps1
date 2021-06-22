$report= Get-DlpDetailReport -StartDate 05/01/2021 -EndDate 06/22/2021 -Action BlockAccess |Select  Actor, DLPComplianceRule , DlpCompliancePolicy, SensitiveInformationType, Action , LastModifiedTime, AttachmentNames
Function Get-FileName($initialDirectory) {   
    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") |
    Out-Null

    $SaveFileDialog = New-Object System.Windows.Forms.SaveFileDialog
    $SaveFileDialog.initialDirectory = $initialDirectory
    $SaveFileDialog.filter = "CSV file (*.csv)|*.csv| All Files (*.*)|*.*";
    $SaveFileDialog.ShowDialog() | Out-Null
    $SaveFileDialog.filename
}
$SaveMyFile = Get-Filename

$report | Export-Csv -Path $SaveMyFile
