echo "install drivers via winget"
echo "May need a good network environment"
winget source update

# driver
(
	"Intel.IntelDriverAndSupportAssistant",
	"Nvidia.GeForceExperience",
	"Nvidia.CUDA",
	"Logitech.UnifyingSoftware"
) | foreach {winget install -e --accept-package-agreements --id $_}

echo "done"