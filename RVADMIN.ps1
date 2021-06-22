#Encrypt Password
#Read-Host -Prompt “Enter your password” -AsSecureString | ConvertFrom-SecureString | Out-File “D:\OneDrive\HPT\Dự án\Russin&vecchi\PasswordPS.txt“

$AdminName = “nhphuc@russinvecchi.com.vn”
$Pass = Get-Content “D:\OneDrive\HPT\Dự án\Russin&vecchi\PasswordPS.txt” | ConvertTo-SecureString
$Cred = new-object -typename System.Management.Automation.PSCredential -argumentlist $AdminName, $Pass
Connect-MsolService -Credential $Cred
Connect-ExchangeOnline -Credential $Cred
Connect-MsolService -Credential $Cred

#Get-MessageTrace -StartDate (get-date).AddDays(-10) -EndDate (get-date) -SenderAddress *@hpt.vn