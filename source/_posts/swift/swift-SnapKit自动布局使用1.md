---
title: swift-SnapKit自动布局使用1
tags: 
- swift 
- SnapKit
categories: swift
---
swift自动布局库SnapKit使用详解1
SnapKit 前身是Masonry（一个oc版本的布局库）

1 安装

SnapKit github地址 https://github.com/SnapKit/SnapKit

可以通过Cocoapods 安装
在Podfile中加入

```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!
pod 'SnapKit'
```
然后在终端项目目录下输入

```
pod install
```

2 SnapKit的使用方法
snp_makeConstraints 来添加view的约束

* 边距，宽，高，左上右下，基准线。
* 修正位移（inset，offset）
* 倍率修正（multipliedBy）

注意： 使用 snp_makeConstraints 方法的元素必须事先添加到父元素的中，例如：self.view.addSubview(view)


* .equalTo: 等于
* .lessThanOrEqualTo: 小于等于
* .greaterThanOrEqualTo: 大于等于

3 约束条件参数支持如下三种类型：

（1）视图属性（ViewAttribute）

```
//使当前视图对象的中心x坐标小于等于视图view2的左边的x坐标
make.centerX.lessThanOrEqualTo(view2.snp_left)
```
（2）视图关系（UIView/NSView） 

```
比如想让view.left 大于等于 label.left：

make.left.greaterThanOrEqualTo(label)
这个其实等价于：

make.left.greaterThanOrEqualTo(label.snp_left)
```

（3）严格检测（Strick Checks）

```
比如将宽度和高度属性设置为常量值：
make.height.equalTo(20)
make.width.equalTo(20)
make.top.equalTo(42)
```

4 给视图的各种属性设置约束

（1）width、height属性

```
自动布局允许宽度、高度设置为常量值。

make.height.equalTo(20)
make.width.equalTo(self.buttonSize.width)
//当前视图与label的顶部齐平
make.top.equalTo(label.snp_top)
```

（2） left、right、top、centerX、centerY等其他属性

```
这些属性直接设置常量值，表示他们相对于父容器的相对约束条件。

当然也可以使用与其他视图的关系来添加约束。
```

（3）edges(边缘）

```
//让当前视图 的 上下左右(top,left,bottom,right) 等于 view2
make.edges.equalTo(view2)
```

（4）size(尺寸）

```
//当前视图宽高 >= titleLabel
make.size.greaterThanOrEqualTo(titleLabel)
```

（5）center(中心）

```
//当前视图与 button1中心相同 （centerX 和 centerY）
make.center.equalTo(button1)
```

5 位移修正与倍率修正

（1）内位移修正：inset

```
视图view，它距离父视图上、左、下、右边距分别是10、15、20、25

make.edges.equalTo(boxOutter).inset(UIEdgeInsetsMake(10, 15, 20, 25))
上面边距的偏移设置实际上相当于如下形式：

make.top.equalTo(boxOutter).offset(10)
make.left.equalTo(boxOutter).offset(15)
make.bottom.equalTo(boxOutter).offset(-20)
make.right.equalTo(boxOutter).offset(-25)
```

（2）外位移修正：offset 

```
视图比视图宽度加50，高度减50。
make.size.equalTo(boxOutter).offset(CGSizeMake(50, -50))
```

（3）倍率修正：multipliedBy 

```
视图的尺寸设置成视图一半大小。
make.size.equalTo(boxOutter).multipliedBy(0.5)
 ```
