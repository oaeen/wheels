[GitHub - yutto-dev/yutto: 一个可爱且任性的 B 站视频下载器（bilili2.x）](https://github.com/yutto-dev/yutto)

## 使用

* `docker run --rm -it -v /path/to/download:/app siguremo/yutto`

* eg.
  
  * `docker run --rm -it -v /e/videos:/app siguremo/yutto BV1vz4y117h9`
  
  * `docker run --rm -it -v /e/videos:/app siguremo/yutto --batch --proxy http://127.0.0.1:7890 https://www.bilibili.com/video/BVxxxxxxxx`
