在本地创建一个和 Colab 几乎 相同的 Python 环境，减少/避免因 Python 包版本等 导致的程序问题

## 本地搭建 build in local 

### create conda env

```
# conda init
conda create -n colab python=3.8
conda activate colab
```

### install python env

```
# make your requirements.txt, then

pip3 install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu116
pip install --requirement colab.txt --cache-dir="pkgs" --index-url http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com
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
wget https://repo.anaconda.com/miniconda/Miniconda3-py38_23.1.0-1-Linux-x86_64.sh
# install miniconda 
bash https://repo.anaconda.com/miniconda/Miniconda3-py38_23.1.0-1-Linux-x86_64.sh

# conda init
conda create -n py38 python=3.8
conda activate py38

```

### install python env

```
# make your requirements.txt, then
pip3 install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu116

pip install --requirement colab.txt --cache-dir="pkgs" --index-url http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com
```

其他步骤类似


## 附：废弃的部分 Python 包

因为编译或其他原因没有安装的包

```
# colab & google 相关包
# jaxlib @ https://storage.googleapis.com/jax-releases/cuda11/jaxlib-0.3.22+cuda11.cudnn805-cp37-cp37m-manylinux2014_x86_64.whl
# en-core-web-sm @ https://github.com/explosion/spacy-models/releases/download/en_core_web_sm-3.4.1/en_core_web_sm-3.4.1-py3-none-any.whl
# dlib==19.24.0
# dbus-python==1.2.16
# editdistance==0.5.3
# GDAL==2.2.2
# rpy2==3.4.5
# screen-resolution-extra==0.0.0
# xkit==0.0.0
# python-apt==0.0.0
# pygobject==3.27.5
# pysndfile==1.3.8
# pygobject==3.27.5
# rpy2==3.4.5
# xkit==0.0.0
# httpstan==4.6.1 # linux only
# pystan==3.3.0
# intel-openmp==2023.0.0
```
