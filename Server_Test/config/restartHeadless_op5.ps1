$username = "192.223.27.54\\Administrator"
$password = convertto-securestring -String "STsucks6969" -AsPlainText -Force
$cred = new-object -typename System.Management.Automation.PSCredential -argumentlist $username, $password
$serverNameOrIp = "192.223.27.54"

$s = new-pssession -ComputerName $serverNameOrIp -Credential $cred
Invoke-Command -session $s -ScriptBlock {
    $results = query session;
    $id = $results | Select-String "Administrator\s+(\w+)" |
                         Foreach {$_.Matches[0].Groups[1].Value}
    & psexec -d -u Administrator -p STsucks6969 -i $id.GetValue(0) "C:\headlessclientrestart\op5\restart.bat";
};


Exit-PSSession