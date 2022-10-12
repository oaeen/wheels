# 1. 软件安装

## 1.0 修改执行策略

如未修改过执行策略，即 `get-executionpolicy` 返回结果为 `Restricted`，则需将策略修改为 `remotesigned` 以方便后续执行相关命令

```
# 查询当前执行策略
get-executionpolicy
# 设置当前执行策略 为 RemoteSigned
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

## 1.1 使用 WinGet 安装软件

### 1.1.1 WinGet 安装推荐方式：

* https://aka.ms/getwinget

* Win 11 以上版本 微软商店更新 ‘应用安装程序’

* 从 Github 下载安装 [Microsoft.DesktopAppInstaller](https://github.com/microsoft/winget-cli/releases/)

### 1.1.2 WinGet 安装软件

**注意**: 部分网络条件下，可能会出现 winget 无法使用，建议为 微软服务配置相关代理

**注意**: 脚本执行前需要同意 winget 用户协议（手动使用一次 winget 命令即可，如 `winget search git`）

执行如下脚本即可（使用 管理员身份执行 可避免安装过程的 UAC 弹窗 ）

```
./app_winget.ps1     # 安装常用软件

./driver_winget.ps1  # 安装驱动
```

* 使用 `winget` 升级安装的软件
  
  ```
  winget upgrade --all
  ```

## 1.2 使用 Scoop 安装软件

### 1.2.1 安装 Scoop

在 `powershell` 中执行以下脚本即可

```bash
# scoop install
iex(New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
```

自定义位置，cmd 中执行

```powershell
mklink /J "C:\Users\[user]\scoop\" "D:\Apps\Scoop"
```

### 1.2.2 Scoop 安装软件

> 添加 bucket 需要 Git，请在使用 Scoop 安装前 确保 Git 已安装

执行如下脚本即可：

```
./app_scoop.ps1
```

使用 `scoop` 升级安装的软件

```
scoop update *
```

## 1.3 安装 Chocolatey

```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

# 

> ref https://chrislayers.com/2021/08/01/scripting-winget/

# 2. 软件配置

## 2.0 Fonts

安装如下字体 用于优化 VS Code 显示

https://www.jetbrains.com/zh-cn/lp/mono/

https://fonts.google.com/noto/specimen/Noto+Sans+SC

https://fonts.google.com/specimen/Source+Code+Pro

## 2.1 Git

```
# 设置 email & name
git config --global user.email "me@oaeen.com"
git config --global user.name "oaeen"

# 设置代理
git config --global http.proxy 127.0.0.1:7890
git config --global https.proxy 127.0.0.1:7890
git config --global --add remote.origin.proxy "127.0.0.1:7890"
git config --global http.sslBackend "openssl"
git config --global http.sslCAInfo "C:\Program Files\Git\mingw64\ssl\cert.pem"
```

## 2.2 Zotero

设置 Onedrive 软链接用于同步

```cmd
mklink /J "C:\Users\az\Zotero" "C:\Users\az\OneDrive\Zotero"
```

## 2.3 IrfanView

安装 irfanview 后 可选下载 & 安装 irfanview plugins

https://www.irfanview.com/64bit.htm



