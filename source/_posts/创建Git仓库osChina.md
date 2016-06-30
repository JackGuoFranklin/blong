---
title: 创建Git仓库（git@oschina&sourceTree）
tags: 
- git
- git@osChina
- sourceTree
categories: git
---

创建Git仓库（git@oschina&sourceTree）

1.创建远程仓库

进入https://git.oschina.net/点击＋号，创建新项目

2.部署公钥（可以暂时不用公钥的）

在项目界面，管理－》部署公钥－》添加公钥，按照git@oschina上面的步骤，一步步生成公钥并添加到项目中。

3.将远程仓库与本地仓库关联起来（也是最关键的一步）

（1）复制远程仓库的git地址。

（2）打开sourceTree，依次点击：新仓库－》从URL克隆－》将远程仓库的地址粘贴到“源URL”，目标路径选择自己要存放的位置（路径A）（一定得是一个空的文件夹，否则会报错）－》克隆

4.在路径A下创建工程，或者将原来就存在的工程放在路径A下面。

5.打开sourceTree，查看是否检测到文件变动。



