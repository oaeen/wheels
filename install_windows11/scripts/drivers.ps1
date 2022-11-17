Write-Output "install drivers via winget"
Write-Output "May need a good network environment"
winget source update

# driver for intel cpu & nvidia gpu
(
	"Intel.IntelDriverAndSupportAssistant",
	"Nvidia.GeForceExperience",
	"Nvidia.CUDA"
) | foreach { winget install -e --accept-package-agreements --id $_ }

Write-Output "done"