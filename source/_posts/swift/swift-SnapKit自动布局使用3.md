---
title: swift-SnapKit自动布局使用3
tags: 
- swift 
- SnapKit
categories: swift
---

1，约束优先级

我们使用SnapKit的时候，还可以定义约束的优先级。

这样当约束出现冲突的时候,优先级高的约束覆盖优先级低的约束。

具体优先级可以放在约束链的结束处。

可以设置如下几种优先级

```
priorityLow()：设置低优先级，优先级为250
priorityMedium()：设置中优先级，优先级为500（这个也就是默认的优先级）
priorityHigh()：设置高优先级，优先级为750
priority()：可以设置任意的优先级，接受的参数是0-1000的数字。比如：priority(600)
```

举例

```
  //初始宽、高为100（优先级低）
            make.width.height.equalTo(100 * self.scacle).priorityLow();
            //最大尺寸不能超过屏幕
            make.width.height.lessThanOrEqualTo(self.view.snp_width)
            make.width.height.lessThanOrEqualTo(self.view.snp_height)

```


2，带有动画效果

配合 UIView.animateWithDuration，我们可以在约束改变的时候有动画效果。 

```
 //动画
 UIView.animateWithDuration(0.3) {
       self.view.layoutIfNeeded()
 }
```

