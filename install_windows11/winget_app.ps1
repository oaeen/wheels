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
  @{ id = "Kitware.CMake" },
  @{ id = "Microsoft.OpenJDK.11" },
  @{ id = "ScooterSoftware.BeyondCompare.5" },
  @{ id = "Tencent.UGit" },
  @{ id = "Enigma.VirtualBox" },
  @{ id = "OpenJS.NodeJS.LTS" },
  
  
  
  # daily
  @{ id = "Telegram.TelegramDesktop" }, 
  @{ id = "Tencent.QQ.NT" }, 
  @{ id = "Tencent.WeChat.Universal" }, 
  @{ id = "Tencent.TencentMeeting" }, 
  @{ id = "Valve.Steam" }, 
  @{ id = "EpicGames.EpicGamesLauncher" }, 
  
  # tools
  @{ id = "NetEase.UURemote" },
  @{ id = "kangfenmao.CherryStudio" },
  @{ id = "Tencent.WeType" },
  
  
  @{ id = "Rizonesoft.Notepad3" }, 
  @{ id = "SumatraPDF.SumatraPDF" },
  @{ id = "IrfanSkiljan.IrfanView" },
  @{ id = "IrfanSkiljan.IrfanView.PlugIns" },
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
  @{ id = "voidtools.Everything" }, 
  @{ id = "Bopsoft.Listary" }, 
  @{ id = "CrystalDewWorld.CrystalDiskInfo" }, 
  @{ id = "CrystalDewWorld.CrystalDiskMark" }, 
  @{ id = "UderzoSoftware.SpaceSniffer" }, 
  @{ id = "GeekUninstaller.GeekUninstaller" },
  @{ id = "Rufus.Rufus" }, 
  @{ id = "CPUID.CPU-Z" }, 
  @{ id = "M2Team.NanaZip" }, 
  
  # Microsoft Store
  @{ id = "XP89DCGQ3K6VLD" }, # Microsoft PowerToys
  @{ id = "9NBLGGH5R558" }, # Microsoft Todo	
  @{ id = "9WZDNCRFJ3PS" }, # Microsoft Remote Desktop
  @{ id = "9P1WXPKB68KX" }  # Snipaste
  
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
Write-Output "Nvidia.CUDA link: https://developer.nvidia.com/cuda-toolkit-archive"
Write-Output "Nvidia.GeForceExperience link: https://www.nvidia.cn/geforce/drivers/"
Write-Output "WSA link: https://github.com/LSPosed/MagiskOnWSALocal"
Write-Output "Microsoft 365 via https://account.microsoft.com/services/microsoft365/"
Write-Output "SimpleTex link: https://simpletex.cn/"
Write-Output "Your Device Drivers & Custom Apps"



