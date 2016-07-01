---
title: Swift使用AVFoundation实现条形码扫描
tags: 
- swift
- QRCode
- AVFoundation
categories: swift
---

Swift - 使用AVFoundation实现条形码扫描（附：拉近镜头改善读取）

1，条形码（一维码）的扫描读取

metadataObjectTypes 做如下修改

```
self.output.metadataObjectTypes = [AVMetadataObjectTypeEAN13Code,
        AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode128Code,
        AVMetadataObjectTypeCode39Code,AVMetadataObjectTypeCode93Code]
```

2，拉近镜头，改善条形码读取效果

如果条码太小的时候,就会识别不出来。

解决办法是：通过代码拉近镜头焦距，放大内容区域让机器更好的识别。


```
import UIKit
import AVFoundation
 
class ViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate,
UIAlertViewDelegate{
     
    var scanRectView:UIView!
    var device:AVCaptureDevice!
    var input:AVCaptureDeviceInput!
    var output:AVCaptureMetadataOutput!
    var session:AVCaptureSession!
    var preview:AVCaptureVideoPreviewLayer!
     
    override func viewDidLoad() {
        super.viewDidLoad()
         
        fromCamera()
    }
     
    //通过摄像头扫描
    func fromCamera() {
        do{
            self.device = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
             
            self.input = try AVCaptureDeviceInput(device: device)
             
            self.output = AVCaptureMetadataOutput()
            output.setMetadataObjectsDelegate(self, queue: dispatch_get_main_queue())
             
            self.session = AVCaptureSession()
            if UIScreen.mainScreen().bounds.size.height<500 {
                self.session.sessionPreset = AVCaptureSessionPreset640x480
            }else{
                self.session.sessionPreset = AVCaptureSessionPresetHigh
            }
             
            self.session.addInput(self.input)
            self.session.addOutput(self.output)
             
            self.output.metadataObjectTypes = [AVMetadataObjectTypeEAN13Code,
                AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode128Code,
                AVMetadataObjectTypeCode39Code,AVMetadataObjectTypeCode93Code]
             
            //计算中间可探测区域
            let windowSize:CGSize = UIScreen.mainScreen().bounds.size;
            let scanSize:CGSize = CGSizeMake(windowSize.width*3/4,
                windowSize.width*3/4);
            var scanRect:CGRect = CGRectMake((windowSize.width-scanSize.width)/2,
                (windowSize.height-scanSize.height)/2, scanSize.width, scanSize.height);
            //计算rectOfInterest 注意x,y交换位置
            scanRect = CGRectMake(scanRect.origin.y/windowSize.height,
                scanRect.origin.x/windowSize.width,
                scanRect.size.height/windowSize.height,
                scanRect.size.width/windowSize.width);
            //设置可探测区域
            self.output.rectOfInterest = scanRect
             
            self.preview = AVCaptureVideoPreviewLayer(session:self.session)
            self.preview.videoGravity = AVLayerVideoGravityResizeAspectFill
            self.preview.frame = UIScreen.mainScreen().bounds
            self.view.layer.insertSublayer(self.preview, atIndex:0)
             
            //添加中间的探测区域绿框
            self.scanRectView = UIView();
            self.view.addSubview(self.scanRectView)
            self.scanRectView.frame = CGRectMake(0, 0, scanSize.width, scanSize.height);
            self.scanRectView.center = CGPointMake(
                CGRectGetMidX(UIScreen.mainScreen().bounds),
                CGRectGetMidY(UIScreen.mainScreen().bounds));
            self.scanRectView.layer.borderColor = UIColor.greenColor().CGColor
            self.scanRectView.layer.borderWidth = 1;
             
            //开始捕获
            self.session.startRunning()
             
            //放大
            do {
                try self.device!.lockForConfiguration()
            } catch _ {
                NSLog("Error: lockForConfiguration.");
            }
            self.device!.videoZoomFactor = 1.5
            self.device!.unlockForConfiguration()
             //放大
             
             
        }catch _ as NSError{
            //打印错误消息
            let errorAlert = UIAlertView(title: "提醒",
                message: "请在iPhone的\"设置-隐私-相机\"选项中,允许本程序访问您的相机",
                delegate: self,
                cancelButtonTitle: "确定")
            errorAlert.show()
        }
    }
     
    //摄像头捕获
    func captureOutput(captureOutput: AVCaptureOutput!,
        didOutputMetadataObjects metadataObjects: [AnyObject]!,
        fromConnection connection: AVCaptureConnection!) {
             
            var stringValue:String?
            if metadataObjects.count > 0 {
                let metadataObject = metadataObjects[0]
                    as! AVMetadataMachineReadableCodeObject
                stringValue = metadataObject.stringValue
                 
                if stringValue != nil{
                    self.session.stopRunning()
                }
            }
            self.session.stopRunning()
            //输出结果
            let alertView = UIAlertView(title: "一维码", message: stringValue,
                delegate: self, cancelButtonTitle: "确定")
            alertView.show()
    }
     
    //消息框确认后消失
    func alertView(alertView: UIAlertView, willDismissWithButtonIndex buttonIndex: Int) {
        //继续扫描
        self.session.startRunning()
    }
     
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
```
