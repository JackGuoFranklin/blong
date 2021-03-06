---
title: swift_ios_开发之UINavigationController的常用属性
tags: 
- swift
- ios
- UINavigationController
categories: swift
---

Swift开发之UINavigationController的常用属性

1.导航栏是否隐藏

```
self.navigationController?.navigationBar.hidden = false
```

2.导航栏的最底部颜色设置

```
//backgroundColor 是最底下的color 
self.navigationController?.navigationBar.backgroundColor = UIColor.redColor()
```

3.导航栏的表层颜色，即首先看到的颜色

```
//barTintColor 是表层颜色
self.navigationController?.navigationBar.barTintColor = UIColor.grayColor()
```

4.导航栏中间标题title的颜色，大小，字体设置

```
self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.blueColor(),NSFontAttributeName:UIFont(name: "Heiti SC", size: 24.0)!]
```

5.导航栏隐藏左边backitem，即leftbarbuttonitem

```
//完全隐藏backItem//
self.navigationItem.setHidesBackButton(true, animated: true)
```

6.导航栏leftbarbuttonitem的颜色设置

```
swiftself.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
```
7.导航栏leftbarbuttonitem的字体，颜色，大小设置

```
self.navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.blueColor(),NSFontAttributeName: UIFont(name: "Chalkduster", size: 13)!], forState: UIControlState.Normal)
```
8.导航栏重新定义leftbarbuttonitem

```
//重新定义backItem，将覆盖原来的BackItem.与storyboard中拖入一个item，效果一样。都是覆盖原来的backitem。

//第一种代码定义方式
self.navigationItem.setLeftBarButtonItem(UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "function"), animated: true)

//第二种代码定义方式 
self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "function")

//第三种代码定义的方式
self.navigationItem.setLeftBarButtonItem(UIBarButtonItem(title: "<Grandre", style: UIBarButtonItemStyle.Plain, target: self, action: "function"), animated: true)

```

9.导航栏设置成透明

```
//将导航栏设置成透明
self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
self.navigationController!.navigationBar.shadowImage = UIImage()
self.navigationController?.navigationBar.translucent = true
```