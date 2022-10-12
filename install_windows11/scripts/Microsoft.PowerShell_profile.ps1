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

function xwinget() {
    
    $document_path = [Environment]::GetFolderPath('MyDocuments')
    $script_path = $document_path + "\PowerShell\winget_upgrade_with_pinned_package.py"
    Write-Host "python" $script_path
    python $script_path
}