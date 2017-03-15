
---
title: Swift - 状态栏
tags: Swift
categories: Swift
---

状态栏

 ```
  	//状态栏高度
  	let statusHeight = UIApplication.shared.statusBarFrame.height
	//导航栏高度
   	let navigationHeight = self.navigationController?.navigationBar.frame.size.height
```
Swift - 隐藏状态栏（statusBar）的两种方法

1，全局设置

这种方法修改后，整个应用的所有视图都不显示状态栏。

（1）在 Info.plist 中添加如下配置

```
<key>UIViewControllerBasedStatusBarAppearance</key>
<false/>
```

（2）在 General -> Deployment Info 中，将 Hide status bar 勾选。

2，在视图控制器中单独设置

这用方法适合于只隐藏部分页面的状态栏。我们在需要隐藏 statusbar 的 ViewController 中添加如下代码即可。

```
import UIKit
 
class ViewController: UIViewController {
     
    //隐藏状态栏
    override var prefersStatusBarHidden: Bool {
        return true
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
```