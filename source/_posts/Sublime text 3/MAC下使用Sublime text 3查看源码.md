---
title: MAC下使用Sublime text 3查看源码
tags: Sublime text 3
categories: Sublime text 3
---

MAC下使用Sublime text 3查看源码


1. 首先，下载Sublime text 3，官网下载即可，打不开的可以下载我下载过的

2. 配置Sublime text 3

    sublime text 3可以调为中文显示了，设置的方式为：

    配置方式为找到Package Control（不同版本的地方不一样），我是在首选项下方找到的，然后
    
  调开这个页面，安装CTags插件，安装过程中可以在左下方看到一个动的=

装好以后配置，配置一下快捷键

Package Settings->CTags->Mouse Binding Default->复制全部->粘贴到Perference->Package Settings->CTags->Mouse Binding User，把里面的"ctrl+shift"，修改为“command”
查找文件，使用快捷键command+P，在文件中查找方法为command+R
