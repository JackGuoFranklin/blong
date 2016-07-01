---
title: hexo更换主题Next
tags: 
- hexo
categories: hexo
---

 1 下载主题
 
  从终端进入你的hexo目录然后在终端输入如下命令下载主题
 
 ```
 git clone https://github.com/iissnan/hexo-theme-next themes/next
 ```
 2 启用主题
 
 修改当hexo目录下的_config.yml 的theme 选项
 
 ```
 # Extensions
 ## Plugins: https://hexo.io/plugins/
 ## Themes: https://hexo.io/themes/
 theme: next
 ```
 
 3 验证是否启用
 
 ```
 hexo s --debug
 ```
 
访问

```
http://localhost:4000
```
确保站点正确运行。

4 其他配置。

   主题设定
   [next|主题设定](http://theme-next.iissnan.com/theme-settings.html)
   
   第三方服务
   [next|第三方服务](http://theme-next.iissnan.com/third-party-services.html)
