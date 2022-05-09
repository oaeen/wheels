# 0. 系统安装

## 0.1 系统下载推荐网站

   * [Microsoft 官网](https://www.microsoft.com/en-us/software-download/windows11)
   * [MSDN](https://next.itellyou.cn/Original/Index)
   * [Windows Insider Preview Downloads](https://www.microsoft.com/en-us/software-download/windowsinsiderpreviewiso)

## 0.2 启动盘创建推荐工具
      
   * [ventoy](https://www.ventoy.net/cn/index.html) (推荐)
   * [rufus](https://rufus.ie/zh/)

## 0.3 安装
   
   略

## 0.4 激活

[HEU_KMS_Activator](https://github.com/zbezj/HEU_KMS_Activator/releases/)

# 1. 软件安装

## 1.0 修改执行策略

如未修改过执行策略，即 `get-executionpolicy` 返回结果为 `Restricted`，则需将策略修改为 `remotesigned` 以方便后续执行相关命令

```
# 查询当前执行策略
get-executionpolicy
# 设置（需以管理员方式运行）
Set-ExecutionPolicy RemoteSigned
```

## 1.1 使用 WinGet 安装软件

### 1.1.1 WinGet 安装推荐方式：

* Win 11 以上版本 微软商店更新 ‘应用安装程序’

* 从 Github 下载安装 [Microsoft.DesktopAppInstaller](https://github.com/microsoft/winget-cli/releases/)

### 1.1.2 WinGet 安装软件

**注意**: 部分网络条件下，可能会出现 winget 无法使用，建议为 微软服务配置相关代理

**注意**: 脚本执行前需要同意 winget 用户协议（手动使用一次 winget 命令即可，如 winget search git）

执行如下脚本即可（使用 管理员身份执行 可避免安装过程的 UAC 弹窗 ）

```
./winget_app.ps1     # 安装常用软件

./winget_driver.ps1  # 安装驱动
```

* 使用 `winget` 升级安装的软件
  
  ```
  winget upgrade --all
  ```

## 1.2 使用 Scoop 安装软件


### 1.2.1 安装 Scoop

在 `powershell ` 中执行以下脚本即可

```
# scoop install
iex(New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
```


### 1.2.2 Scoop 安装软件
> 添加 bucket 需要 Git，请在使用 Scoop 安装前 确保 Git 已安装

执行如下脚本即可：

```
./scoop_app.ps1
```

使用 `scoop` 升级安装的软件

```
scoop update *
```

## 1.3 安装 Chocolatey

```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

# 2. WSL2 配置

```
# 安装wsl2 https://docs.microsoft.com/zh-cn/windows/wsl/install
wsl --install

# 安装 Ubuntu 22.04 LTS
winget install -e --accept-package-agreements --id 9PN20MSR04DW
```
> ref https://chrislayers.com/2021/08/01/scripting-winget/