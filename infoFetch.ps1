param($Server, $User, $Password, $VMName, $GuestOsUser, $GuestOsPassword)

$FILE_NAME = "$Name.log"

Write-Host "$filename"
Connect-VIServer -Server $Server -User $User -Password $Password

$script = @"
sudo echo "hello" >> "$FILE_NAME"
"@

Invoke-VMScript -VM $VMName -ScriptText $script -GuestUser $GuestOsUser -GuestPassword  $GuestOsPassword -ScriptType bash

$script =  @"

cat "$FILE_NAME"
"@


Invoke-VMScript -VM $VMName -ScriptText $script -GuestUser $GuestOsUser -GuestPassword  $GuestOsPassword -ScriptType bash