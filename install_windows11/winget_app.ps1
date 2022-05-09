echo "install apps via winget"
echo "May need a good network environment"
winget source update

#Install New apps
$apps = @(
  # daily
    @{ id = "Google.Chrome" }, 
    @{ id = "Telegram.TelegramDesktop" }, 
    @{ id = "Tencent.WeChat" }, 
    @{ id = "Tencent.TencentMeeting" }, 
    
  # tools
    @{ id = "Fndroid.ClashForWindows" }, 
    @{ id = "Bopsoft.Listary.Beta" }, 
    @{ id = "cuiliang.quicker" }, 
    @{ id = "voidtools.Everything" }, 
    @{ id = "xiaomi.miuiplus" }, 
    @{ id = "Microsoft.PowerToys" }, 
    @{ id = "agalwood.Motrix" }, 
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

echo "install apps below via winget source from MS Store"
# MS Store
(

	"9NHLGF0ZWC5S",		# QQ
	"9NBLGGH5R558",		# Microsoft Todo	
	"9MSPC6MP8FM4",		# Microsoft Whiteboard
	"9P1WXPKB68KX",		# Snipaste
	"9WZDNCRFHWQT",		# DrawboardPDF
	"9PLFNLNT3G5G",		# Intel® Graphics Command Center
	"XPDNH1FMW7NB40",	# 火绒安全软件
	"9NBLGGH43K0T"		# 小米感应钥匙
) | foreach {winget install -e --accept-package-agreements --id $_}

echo "卸载 Windows Widget"
winget uninstall MicrosoftWindows.Client.WebExperience_cw5n1h2txyewy

echo "以下应用需手动安装"
echo "Jetbrains Tools via toolbox"
echo "Microsoft 365 via https://account.microsoft.com/services/microsoft365/"
echo "小米游戏盒子/小米云服务/MiFlash"



