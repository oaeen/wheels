Write-host "install via scoop: "
Write-host "May need a good network environment"

scoop bucket add extras
scoop install trafficmonitor adb

scoop bucket add nerd-fonts
scoop install JetBrains-Mono Cascadia-Code

Write-host "install done"
