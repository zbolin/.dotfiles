$ChocolateyProfile = "$env:ChocolateyIntall\helpers\chocolateyProfile.psm1"
if(Test-Path($ChocolateyProfile)){
    Import-Module = "$ChocolateyProfile"
}

Import-Module 'C:\tools\poshgit\dahlbyk-posh-git-9bda399\src\posh-git.psd1'

function fn {
	nvim 'C:\Users\Z\Documents\WindowsPowershell\Microsoft.PowerShell_profile.ps1'
}

function s {
    @(
        $Profile.AllUsersAllHosts,
        $Profile.AllUsersCurrentHost,
        $Profile.CurrentUserAllHosts,
        $Profile.CurrentUserCurrentHost
    ) | % {
        if(Test-Path $_){
            Write-Verbose "Running $_"
            . $_
        }
    }
}

function wsl {
    wsl.exe
}

function guid {
    [guid]::NewGuid().Guid
}

function remove($a) {
    Remove-Item $a -Recurse -Force
}

function sbr {
    mvn spring-boot:run
}

function mci {
    mvn clean install
}

function mciq {
    mvn clean install -quiet
}

function mcidst {
    mvn clean install -DskipTests
}

function clone($a) {
    git clone git@bitbucket.org/$a.git
}

function cloneb($a,$b) {
    git clone git@bitbucket.org/$a.git -b $b
}

function d {
    cd 'C:\Users\Z\Desktop'
}

function doc {
    cd 'C:\Users\Z\Documents'
}

function dn {
    cd 'C:\Users\Z\Downloads'
}

function gp {
    cd 'C:\Users\Z\GitProjects'
}

function settings {
    nvim 'C:\Users\Z\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\localstate\settings.json'
}
