Write-Output "install apps via winget"
Write-Output "May need a good network environment"
winget source update

#Install New apps
$apps = @(
  # dev env
  @{ id = "Google.Chrome" }, 
  @{ id = "Git.Git" }, 
  @{ id = "Microsoft.PowerShell" }, 
  @{ id = "JanDeDobbeleer.OhMyPosh" }, 
  @{ id = "Microsoft.VisualStudioCode" }, 
  @{ id = "Docker.DockerDesktop" }, 
  @{ id = "Anaconda.Miniconda3" }, 
  @{ id = "GoLang.Go" }, 
  @{ id = "VMware.WorkstationPro" }, 
  @{ id = "JetBrains.Toolbox" },
  
  # daily
  @{ id = "Telegram.TelegramDesktop" }, 
  # @{ id = "Tencent.QQ" },  recommended to use QQ NT version, which is not available in winget
  @{ id = "Tencent.WeChat" }, 
  @{ id = "Tencent.TencentMeeting" }, 
  @{ id = "Valve.Steam" }, 
  
  # tools
  @{ id = "GyDi.ClashVerge" }, 
  @{ id = "Youqu.ToDesk" },
  @{ id = "Guru3D.Afterburner" },
  
  @{ id = "Tonec.InternetDownloadManager" },
  @{ id = "qBittorrent.qBittorrent" }, 
  @{ id = "WinSCP.WinSCP" }, 
  
  @{ id = "Rizonesoft.Notepad3" }, 
  @{ id = "appmakes.Typora" }, 
  @{ id = "JohnMacFarlane.Pandoc" }, 
  @{ id = "SumatraPDF.SumatraPDF" },
  
  @{ id = "Daum.PotPlayer" }, 
  @{ id = "IrfanSkiljan.IrfanView" },
  
  @{ id = "DigitalScholar.Zotero" }, 
  @{ id = "LutzRoeder.Netron" }, 
  
  @{ id = "M2Team.NanaZip" },
  @{ id = "LiErHeXun.Quicker" }, 
  @{ id = "voidtools.Everything" }, 
  @{ id = "Microsoft.PowerToys" }, 
  @{ id = "Bopsoft.Listary" }, 

  # Microsoft Store
  @{ id = "9NBLGGH5R558" }, # Microsoft Todo	
  @{ id = "9MSPC6MP8FM4" }, # Microsoft Whiteboard
  @{ id = "9WZDNCRFJ3PS" }, # Microsoft Remote Desktop
  @{ id = "9P1WXPKB68KX" }, # Snipaste
  @{ id = "9NBLGGH1ZBKW" }, # Dynamic Theme
  @{ id = "XPDNH1FMW7NB40" }	# 火绒安全软件
);

Foreach ($app in $apps) {
  #check if the app is already installed
  $listApp = winget list --exact -q $app.id
  if (![String]::Join("", $listApp).Contains($app.id)) {
    Write-host "Installing:" $app.id
    winget install -e --accept-package-agreements --id $app.id
  }
  else {
    Write-host $app.id "has been installed, skipping the installation"
  }
}

Write-Output "-----------------Installed Done-----------------"
Write-Output "The following applications need to be installed manually"
Write-Output "Jetbrains Tools via toolbox"
Write-Output "Microsoft 365 via https://account.microsoft.com/services/microsoft365/"
Write-Output "Your Device Drivers & Custom Apps"



