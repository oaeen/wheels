Write-Output "install apps via winget"
Write-Output "May need a good network environment"
winget source update

#Install New apps
$apps = @(
  # daily
  @{ id = "Google.Chrome" }, 
  @{ id = "Telegram.TelegramDesktop" }, 
  @{ id = "Tencent.QQ" }, 
  @{ id = "Tencent.WeChat" }, 
  @{ id = "Tencent.TencentMeeting" }, 
    
  # tools
  @{ id = "Fndroid.ClashForWindows" }, 
  @{ id = "Bopsoft.Listary.Beta" }, 
  @{ id = "cuiliang.quicker" }, 
  @{ id = "Stardock.Start11" },
  @{ id = "voidtools.Everything" }, 
  @{ id = "xiaomi.miuiplus" }, 
  @{ id = "Microsoft.PowerToys" }, 
  @{ id = "agalwood.Motrix" }, 
  @{ id = "Alibaba.aDrive" },
  @{ id = "MarkText.MarkText" }, 
  @{ id = "JohnMacFarlane.Pandoc" }, 
  @{ id = "SumatraPDF.SumatraPDF" },
  @{ id = "M2Team.NanaZip" },
  @{ id = "Bilibili.Livehime" }, 
  @{ id = "WinSCP.WinSCP" }, 
  @{ id = "LutzRoeder.Netron" }, 
  @{ id = "Tonec.InternetDownloadManager" }, 
  @{ id = "Daum.PotPlayer" }, 
  @{ id = "IrfanSkiljan.IrfanView" }, 
  @{ id = "Alibaba.Yuque" }, 
  @{ id = "Zotero.Zotero" }, 
  @{ id = "Yemiao.Xtranslator" },
  @{ id = "Valve.Steam" }, 
    
    
  # dev env
  @{ id = "Git.Git" }, 
  @{ id = "Microsoft.PowerShell" }, 
  @{ id = "JanDeDobbeleer.OhMyPosh" }, 
  @{ id = "Microsoft.VisualStudioCode" }, 
  @{ id = "Docker.DockerDesktop" }, 
  @{ id = "Anaconda.Anaconda3" }, 
  @{ id = "GoLang.Go" }, 
  @{ id = "VMware.WorkstationPro" }, 
  @{ id = "JetBrains.Toolbox" }
    
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




Write-Output "uninstall Windows Widget"
winget uninstall MicrosoftWindows.Client.WebExperience_cw5n1h2txyewy

Write-Output "The following applications need to be installed manually"
Write-Output "Jetbrains Tools via toolbox"
Write-Output "Microsoft 365 via https://account.microsoft.com/services/microsoft365/"
Write-Output "Your Device Drivers & Custom Apps"



