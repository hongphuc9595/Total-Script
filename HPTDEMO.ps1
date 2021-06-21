#Encrypt Password
#Read-Host -Prompt “Enter your password” -AsSecureString | ConvertFrom-SecureString | Out-File “D:\Password-Demo.txt“

$AdminName = “nhphuc@hptdemo.tech”
$Pass = Get-Content “D:\Password-Demo.txt” | ConvertTo-SecureString
$Cred = new-object -typename System.Management.Automation.PSCredential -argumentlist $AdminName, $Pass
Connect-MsolService -Credential $Cred
Connect-ExchangeOnline -Credential $Cred