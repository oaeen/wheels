# 0. 系统安装

## 0.1 系统下载推荐网站

- [Microsoft 官网](https://www.microsoft.com/en-us/software-download/windows11)
- [MSDN](https://next.itellyou.cn/Original/Index)
- [Windows Insider Preview Downloads](https://www.microsoft.com/en-us/software-download/windowsinsiderpreviewiso)

## 0.2 启动盘创建推荐工具

- [ventoy](https://www.ventoy.net/cn/index.html) (推荐)
- [rufus](https://rufus.ie/zh/)

## 0.3 安装

* 可选项，重定向用户文件夹至 D 盘 或 其他相应位置，在系统安装创建用户前，通过`Shift F10` 打开命令行窗口，键入如下命令  
  
  ```shell
  # 复制 C:\Users 到 D:\Users
  robocopy "C:\Users" "D:\Users" /E /COPYALL /XJ
  # 删除C:\Users文件夹 
  rmdir "C:\Users" /S /Q 
  # 创建硬链接 使 C:\Users 指向 D:\Users
  mklink /J "C:\Users" "D:\Users"
  ```

## 0.4 激活

[HEU_KMS_Activator](https://github.com/zbezj/HEU_KMS_Activator/releases/)

# 附：自用系统安装配置

* `app_install.md` 介绍 Windows 常用软件配置流程

* `wsl_install.md` 介绍 WSL(Windows Subsystem Linux) 配置过程

* `app_scoop.ps1` 使用 scoop 进行软件批量安装的 脚本

* `app_winget.ps1` 使用 winget 进行软件批量安装的脚本

* `drivers_winget.ps1` 使用 winget 进行驱动批量安装的脚本

* `oh-my-tuna.py` 镜像源一键配置，[ref: Oh My TUNA](https://tuna.moe/oh-my-tuna/)
