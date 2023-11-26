Import-Module oh-my-posh
Set-PoshPrompt -Theme ys

function hypervon() {
    bcdedit /set hypervisorlaunchtype auto
    shutdown /r
}

function hypervoff() {
    bcdedit /set hypervisorlaunchtype off
    shutdown /r
}