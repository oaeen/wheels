Write-Output "install drivers via winget"
Write-Output "May need a good network environment"
winget source update

# driver for intel cpu & nvidia gpu
(
	"Intel.IntelDriverAndSupportAssistant"
) | foreach { winget install -e --accept-package-agreements --id $_ }

Write-Output "done"