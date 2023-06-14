在本地创建一个和 Colab 几乎 相同的 Python 环境，减少/避免因 Python 包版本等 导致的程序问题

## 本地搭建 build in local 

### create conda env

```
# conda init
conda create -n colab python=3.10
conda activate colab
```

### install python env

```

git clone https://github.com/googlecolab/backend-info.git
# and make your requirements.txt, then

pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
pip install --requirement pip-freeze.txt --cache-dir="pkgs" --index-url http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com
```


## 为服务器打包 pack env for sever

### pack

```
conda activate base
conda install -c conda-forge conda-pack
conda pack -n colab
```

### restore

```
# unzip
7z.exe x colab.tar -oC:\ProgramData\Miniconda3\envs\colab

# source activate colab
C:\ProgramData\Miniconda3\envs\colab\Scripts\activate.bat
C:\ProgramData\Miniconda3\envs\colab\Scripts\conda-unpack.exe
```

## 环境验证 

```
import torch
torch.cuda.is_available()

import tensorflow as tf
tf.test.is_gpu_available()
```


## 附：ubuntu 下 搭建

```
# 拉取 docker 镜像
docker pull ubuntu:20.04

# exec ubuntu
apt update
apt install wget vim gcc cmake libpq-dev python-dev build-essential -y

```

### install miniconda

```
# download miniconda 
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
# install miniconda 
bash https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh

# conda init
conda create -n playground python=3.10
conda activate playground

```

### install python env

```
# make your requirements.txt, then
pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118

pip install --requirement pip-freeze.txt --cache-dir="pkgs" --index-url http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com
```

其他步骤类似

