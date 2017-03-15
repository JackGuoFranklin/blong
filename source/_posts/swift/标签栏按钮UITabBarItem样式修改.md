---
title: 标签栏按钮UITabBarItem样式修改
tags: 
- swift
- UITabBarItem
categories: swift
---

Swift - 标签栏按钮UITabBarItem样式修改

1，tabBarItem图片的推荐尺寸和最大支持尺寸
下面是标签栏（UITabBar）中tab按钮图标分别在1x、2x、3x下不会压缩变形的尺寸：

```
@1x : 推荐 25 x 25   (最大: 48 x 32)
@2x : 推荐 50 x 50   (最大: 96 x 64)
@3x : 推荐 75 x 75   (最大: 144 x 96)
```

2，修改图片和文字的颜色 
（1）图片和文字同时改变

```
//图片文字一起变色
self.tabBar.tintColor = UIColor.orange()
```

（2）只改变文字颜色

```
//改变文字颜色
UITabBarItem.appearance().setTitleTextAttributes(
    [NSForegroundColorAttributeName: UIColor.gray], forState:.normal)
UITabBarItem.appearance().setTitleTextAttributes(
    [NSForegroundColorAttributeName: UIColor.orange], forState:.selected)
```

（3）只改变图片颜色

```
self.tabBar.tintColor = UIColor.orange()
//文字颜色还原
UITabBarItem.appearance().setTitleTextAttributes(
    [NSForegroundColorAttributeName: self.view.tintColor], forState:.selected)
```

3，选中时、不选中时使用不同图片
默认标签选中、不选中都使用的是同一个图片，只是颜色不同。我们也可使用两张不同图片表示两种状态。

```
qq.tabBarItem = UITabBarItem(title: "QQ", image: UIImage(named: "qq"),
    selectedImage: UIImage(named: "qq_active"))
 
android.tabBarItem = UITabBarItem(title: "Android", image: UIImage(named: "android"),
    selectedImage: UIImage(named: "android_active"))
```

4，使用图片的原始颜色
默认不管原图是什么颜色，渲染器都会将渲染成单一颜色，虽说符合现在扁平化的趋势，但有时我们还是想要使用图片原来的样子。

```
qq.tabBarItem =  UITabBarItem(title: "QQ", image: UIImage(named: "qq_color"),
    selectedImage: UIImage(named: "qq_color")?.imageWithRenderingMode(.AlwaysOriginal))
 
android.tabBarItem =  UITabBarItem(title: "Android", image: UIImage(named: "android_color"),
    selectedImage: UIImage(named: "android_color")?.imageWithRenderingMode(.AlwaysOriginal))
```



