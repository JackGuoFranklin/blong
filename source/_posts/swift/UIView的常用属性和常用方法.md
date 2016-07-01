---
title: UIView的常用属性和常用方法总结
tags: 
- swift
categories: swift
---


UIView的常用属性和常用方法总结

1，UIView常用的一些属性如下：

```
frame：相对父视图的坐标和大小（x,y,w,h）
bounds：相对自身的坐标和大小，所以bounds的x和y永远为0（0,0,w,h）
center：相对父视图的中点坐标
transform：控制视图的放大缩小和旋转
superview：获取父视图
subviews：获取所有子视图
alpha：视图的透明度（0.0-1.0）
tag：视图的标志（Int类型，默认等于0），设置后，可以通过viewWithTag方法拿到这个视图
````

2，UIView的常用方法如下：

```
func removeFromSuperview()：将视图从父视图中移除
func insertSubview(view:UIView, atIndex index:Int)：指定一个位置插入一个视图，index越小，视图越往下
func exchangeSubviewAtIndex(index1:Int, withSubviewAtIndex index2:Int)：将index1和index2位置的两个视图互换位置
func addSubview(view:UIView)：添加视图到父视图
func insertSubview(view:UIView,belowSubview siblingSubview:UIView)：在指定视图的下面插入视图
func insertSubview(view:UIVIew,aboveSubview siblingSubview:UIView)：在指定视图上面插入视图
func bringSubviewToFront(view:UIView)：把视图移到最顶层
func sendSubviewToBack(view:UIView)：把视图移到最底层
func viewWithTag(tag:Int)->UIView?：根据tag值获取视图
```
