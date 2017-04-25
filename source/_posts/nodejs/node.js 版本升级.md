---
title: node.js 版本升级
tags: node.js
categories: node.js
---

一行命令搞定node.js 版本升级

首先安装n模块：

```
npm install -g n
```
第二步：
升级node.js到最新稳定版

```
n stable
```

n后面也可以跟随版本号比如：

```
n v0.10.26
或
n 0.10.26
```

另外分享几个npm的常用命令

```
npm -v          #显示版本，检查npm 是否正确安装。

npm install express   #安装express模块

npm install -g express  #全局安装express模块

npm list         #列出已安装模块

npm show express     #显示模块详情

npm update        #升级当前目录下的项目的所有模块

npm update express    #升级当前目录下的项目的指定模块

npm update -g express  #升级全局安装的express模块

npm uninstall express  #删除指定的模块
```
