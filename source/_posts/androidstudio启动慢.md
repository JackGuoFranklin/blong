---
title: android studio启动慢
tags: 
- android
- android studio
categories: android
---

### android studio每次启动都要在fetching Android sdk compoment information停好久 怎么解决？

1）进入刚安装的Android Studio目录下的bin目录。找到idea.properties文件，用文本编辑器打开。

2）在idea.properties文件末尾添加一行： disable.android.first.run=true ，然后保存文件。

3）关闭Android Studio后重新启动，便可进入界面。

可以解决。