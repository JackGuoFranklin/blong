---
title: ios存储方式做之一UserDefaults
tags: 
- swift
- UserDefaultstags
categories: swift
---

ios存储方式做之一UserDefaults

1、UserDefaults支持的数据格式有：Number、Data、Date、String、Array、Dictionary、BOOL

2、以键值对的形式进行存储

3、存储时间为整体应用程序的存储时间，如果想需要删除，需要删除整体应用程序

使用方法
1，初始化一个userDefaults

let userDefaults = UserDefaults.standard

UserDefaults.standard.set(true, forKey: "isFrist")

2，把数据存到磁盘上
 userDefaults.synchronize()
 
3，删除
userDefaults.removeObject(forKey: <#T##String#>)

4，打印app资源目录路径
 let path = Bundle.main.bundlePath





