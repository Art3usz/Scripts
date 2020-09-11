$currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
$testadmin = $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
if ($testadmin -eq $false) {
Start-Process powershell.exe -Verb RunAs -ArgumentList ('-noprofile -noexit -file "{0}" -elevated' -f ($myinvocation.MyCommand.Definition))
exit $LASTEXITCODE
}
function PackageInstallStuff{
    $Packages ='adobereader', 'anaconda3','firefox','git','gimp', 'googlechrome','gns3','intellijidea-edu', 'jre8','nodejs', 'notepadplusplus','putty','pycharm-edu','python','python2', 'qtcreator','rapidminer',' r.studio','sql-server-express','tftpd32','virtualbox','vscode','wireshark','bitnami-xampp'
    ForEach ($PackageName in $Packages)
        {
        choco install $PackageName -y
        }
}


If(Test-Path -Path "$env:ProgramData\Chocolatey") {
    PackageInstallStuff}
Else {
    Set-ExecutionPolicy Bypass -Scope Process -Force; iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex

    PackageInstallStuff
}




