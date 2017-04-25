---
title: swift代理delegate
tags: 
- swift
- delegate
categories: swift
---

实现代理传值
```
import UIKit

class ViewController: UIViewController,ChangeValueDelegate{
    
    var btn = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        btn.setTitle("Change", forState:.Normal)
        btn.backgroundColor = UIColor.blueColor()
        btn.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        btn.addTarget(self, action: #selector(change), forControlEvents: .TouchUpInside)
        self.view.addSubview(btn)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //    delegate 代理方法
    func changeValue(value: String) {
        
        btn.setTitle(value, forState: .Normal)
        print("value:\(value)")
        
    }
    //  传值
    func change(){
        
        let vc = ChangeValueViewController()
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
```

协议

```
protocol ChangeValueDelegate {
    
    func changeValue(value:String)
    
}
```

使用代理传值

```
class ChangeValueViewController: UIViewController {
    
    var delegate:ChangeValueDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.delegate?.changeValue("ok")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
```