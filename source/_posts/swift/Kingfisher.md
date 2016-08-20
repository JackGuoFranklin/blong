
---
title: Swift 图片下载
tags: 
- swift
categories: swift
---

Kingfisher

oc有个非常强大图片缓存处理的库SDWebImage，swift中现在也有个不错的图片处理的库----Kingfisher

Kingfisher库下载图片默认是带缓存的

最简单的使用

```
import Kingfisher
imageView.kf_setImageWithURL(NSURL(string: "http//www.baidu.com.png")!)
```

配置 https

```
在info.plist里加上下面这段
<dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
</dict>
</plist>
去配置一个Dictionary类型的NSAppTransportSecurity 子item是Boolean类型NSAllowsArbitraryLoads value是YES
```

添加默认图

```
testImag.kf_setImageWithURL(NSURL(string: "http://your.png")!, placeholderImage: UIImage(named: "mrt"))
```

默认情况下Kingfisher使用url当做cache(缓存)的key。 不过你也可以自定义这个key 。

```
let URL = NSURL(string: "http://your.png")!
let resource = Resource(downloadURL: URL, cacheKey: "your_customized_key")
imageView.kf_setImageWithResource(resource)
```

Kingfisher 默认先从内存和硬盘搜 ，如果没找到才去URL down，当然你也可以强制它每次从URL down，忽略缓存

```
imageView.kf_setImageWithURL(NSURL(string: "your_image_url")!, placeholderImage: nil, optionsInfo: [.Options: KingfisherOptions.ForceRefresh])
```
下载和缓存系统

```
let downloader = KingfisherManager.sharedManager.downloader

// 修改超时时间
downloader.downloadTimeout = 5

let cache = KingfisherManager.sharedManager.cache

// 设置硬盘最大缓存50M ，默认无限
cache.maxDiskCacheSize = 50 * 1024 * 1024
// 设置硬盘最大保存3天 ， 默认1周
cache.maxCachePeriodInSecond = 60 * 60 * 24 * 3

// 获取硬盘缓存的大小
cache.cache.calculateDiskCacheSizeWithCompletionHandler { (size) -> () in      
    println("disk size in bytes: \(size)")
}

//清理内存缓存
cache.clearMemoryCache()

// 清理硬盘缓存，这是一个异步的操作
cache.clearDiskCache()

// 清理过期或大小超过磁盘限制缓存。这是一个异步的操作
cache.cleanExpiredDiskCache()
```

回调

下载完成后

```
imageView.kf_setImageWithURL(NSURL(string: "your_image_url")!, 
  placeholderImage: nil, 
  optionsInfo: nil, 
  progressBlock: { (receivedSize, totalSize) -> () in 
  println("Download Progress: \(receivedSize)/\(totalSize)") }, 
  completionHandler: { (image, error, imageURL) -> () in 
  println("Downloaded and set!") 
})
```

