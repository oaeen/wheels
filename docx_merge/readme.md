## 安装

```
pip install python-docx docxcompose -i https://pypi.tuna.tsinghua.edu.cn/simple
```



## 运行

默认保存到用户桌面路径下，可在源码中修改，或新建 `.env` 文件夹，输入合并文件路径即可

```
self.desktop = os.path.join(os.path.join(os.environ['USERPROFILE']), 'Desktop')
self.merge_filename = 'A合并后的文件.docx'
self.merge_file = '{}/{}'.format(self.desktop, self.merge_filename)
```



## 打包

```
pip install pyinstaller -i https://pypi.tuna.tsinghua.edu.cn/simple
pyinstaller -F merge.py
```

