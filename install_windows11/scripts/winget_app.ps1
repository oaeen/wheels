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
  @{ id = "Microsoft.VisualStudioCode.Insiders" }, # change to insiders version for copilot chat
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
  @{ id = "EpicGames.EpicGamesLauncher" }, 
  
  # tools
  @{ id = "GyDi.ClashVerge" }, 
  @{ id = "Youqu.ToDesk" },
  
  @{ id = "Rizonesoft.Notepad3" }, 
  @{ id = "SumatraPDF.SumatraPDF" },
  @{ id = "IrfanSkiljan.IrfanView" },
  @{ id = "Daum.PotPlayer" }, 
  @{ id = "JohnMacFarlane.Pandoc" }, 
  @{ id = "Gyan.FFmpeg" },
  
  @{ id = "DigitalScholar.Zotero" }, 
  @{ id = "LutzRoeder.Netron" }, 
  
  @{ id = "Tonec.InternetDownloadManager" },
  @{ id = "qBittorrent.qBittorrent" }, 
  @{ id = "aria2.aria2" }, 
  @{ id = "cURL.cURL" },
  @{ id = "WinSCP.WinSCP" }, 
  @{ id = "M2Team.NanaZip" },
  @{ id = "LiErHeXun.Quicker" }, 
  @{ id = "voidtools.Everything" }, 
  @{ id = "Bopsoft.Listary" }, 
  @{ id = "CrystalDewWorld.CrystalDiskInfo" }, 
  @{ id = "CrystalDewWorld.CrystalDiskMark" }, 
  @{ id = "UderzoSoftware.SpaceSniffer" }, 
  @{ id = "GeekUninstaller.GeekUninstaller" },
  @{ id = "Rufus.Rufus" }, 
  @{ id = "Guru3D.Afterburner" },
  @{ id = "CPUID.CPU-Z" }, 
  
  # Microsoft Store
  @{ id = "XP89DCGQ3K6VLD" }, # Microsoft PowerToys
  @{ id = "9WZDNCRD29V9" }, # Microsoft 365
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
Write-Output "Your Device Drivers & Custom Apps"



