---
title: swift-SnapKit自动布局使用2
tags: 
- swift 
- SnapKit
categories: swift
---

1 保存约束

```
 //保存约束的引用
 var topConstraint:Constraint?
  
 self.topConstraint = make.top.equalTo(self.view).offset(40).constraint
```
    
2 删除约束

```
//移除约束
self.topConstraint?.uninstall()
```
        
3 通过约束的引用来更新约束 updateOffset() 

```
//更新修改约束
self.topConstraint?.updateOffset(60)
```

4 使用snp_updateConstraints更新约束

我们还可以用 snp_updateConstraints 方法来代替 snp_makeConstraints 进行约束的更新，这个更新操作通常放在 UIViewController 的 updateViewConstraints() 方法中，或者 UIView 的 updateConstraints() 方法中执行，这样视图约束需要更新的时候会自动调用。

```
//视图约束更新
    override func updateViewConstraints() {
        self.box.snp_updateConstraints{ (make) -> Void in
            //视图宽度与屏幕等宽
            make.width.equalTo(self.view)
        }
   
        super.updateViewConstraints()
    }
}
```

5 使用snp_remakeConstraints重做约束

```
snp_remakeConstraints 与 snp_makeConstraints 用法类似，不同的是 snp_remakeConstraints 首先会先清除掉之前所有被SnapKit设置的约束。

   //重做约束
        box.snp_remakeConstraints { (make) -> Void in
            make.width.height.equalTo(100)
        }
```

        

