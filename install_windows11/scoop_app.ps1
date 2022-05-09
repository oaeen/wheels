echo "install via scoop: "
echo "May need a good network environment"

scoop bucket add extras
scoop install curl ffmpeg notepad3 geekuninstaller trafficmonitor ventoy spacesniffer

scoop bucket add scoop-zapps https://github.com/kkzzhizhou/scoop-zapps.git
scoop install SunloginClient

scoop bucket add nerd-fonts
scoop install JetBrains-Mono Cascadia-Code

echo "install done"