## 视频格式转换

* FFMPEG 下载
  * 可使用 scoop：`scoop install ffmpeg`
  * 或使用 choco：`choco install ffmpeg`

* 执行 python 文件

  ```
  # eg. mp4 to flv
  
  $ cd ~/videos
  $ python D:\codebase\utils\toys\ffmpeg_convert\ffmpeg_convert.py
  
  # 回车使用当前目录 C:\Users\user1
  # 或输入需要转换的文件夹目录 eg. C:\Users\user1\videos
  
  # 请输入转换前文件类型(eg .mp4) 注意需要输入 `.`
  .mp4
  
  # 请输入转换后文件类型(eg .flv)
  .flv
  
  # 转换完成后会输出完成
  ```

  