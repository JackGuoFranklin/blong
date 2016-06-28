---
title: Swift 二维码QRCode
tags: 
- swift
- QRCode
- AVFoundation
categories: swift
---

Swift 二维码QRCode
1，直接读取图片中的二维码

```
		let qrcodeImg =  UIImage(named: "codeBg.png")
        let ciImage:CIImage=CIImage(image:qrcodeImg!)!
        let context = CIContext(options: nil)
        let detector:CIDetector=CIDetector(ofType: CIDetectorTypeQRCode,
            context: context, options: [CIDetectorAccuracy:CIDetectorAccuracyHigh])
        let features=detector.featuresInImage(ciImage)
        print("扫描到二维码个数：\(features.count)")
        //遍历所有的二维码，并框出
        for feature in features as! [CIQRCodeFeature] {
            print(feature.messageString)
        }
```

2，从相册中选择图片读取二维码

```
 //选取相册
 //判断设置是否支持图片库
        if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary){
            //初始化图片控制器
            let picker = UIImagePickerController()
            //设置代理
            picker.delegate = self
            //指定图片控制器类型
            picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            //弹出控制器，显示界面
            self.presentViewController(picker, animated: true, completion: {
                () -> Void in
            })
        }else{
            print("读取相册错误")
        }
```
//选择图片成功后代理

```
 	//选择图片成功后代理
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        //获取选择的原图
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        //二维码读取
        let ciImage:CIImage=CIImage(image:image)!
        let context = CIContext(options: nil)
        let detector:CIDetector=CIDetector(ofType: CIDetectorTypeQRCode,
            context: context, options: [CIDetectorAccuracy:CIDetectorAccuracyHigh])
        let features=detector.featuresInImage(ciImage)
        print("扫描到二维码个数：\(features.count)")
        //遍历所有的二维码，并框出
        for feature in features as! [CIQRCodeFeature] {
            print(feature.messageString)
        }
        //图片控制器退出
        picker.dismissViewControllerAnimated(true, completion: {
            () -> Void in
        })
    }
```

3，使用摄像头扫描读取二维码

（1）扫描主要使用的是AVFoundation，用起来方便简单

（2）通过 AVCaptureMetadataOutput 的 rectOfInterest 属性，可以设置探测探测区域。同时给这个探测区域添加个方框，只有在框中的二维码才会被扫描到。



```
 	var scanRectView:UIView!
    var device:AVCaptureDevice!
    var input:AVCaptureDeviceInput!
    var output:AVCaptureMetadataOutput!
    var session:AVCaptureSession!
    var preview:AVCaptureVideoPreviewLayer!
```

//通过摄像头扫描
  
```
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
            self.output.metadataObjectTypes = [AVMetadataObjectTypeQRCode]
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
        }catch _ as NSError{
            //打印错误消息
            let errorAlert = UIAlertView(title: "提醒",
                message: "请在iPhone的\"设置-隐私-相机\"选项中,允许本程序访问您的相机",
                delegate: self,
                cancelButtonTitle: "确定")
            errorAlert.show()
        }
```

```
 //摄像头捕获
    func captureOutput(captureOutput: AVCaptureOutput!,
        didOutputMetadataObjects metadataObjects: [AnyObject]!,
        fromConnection connection: AVCaptureConnection!) {
        var stringValue:String?
        if metadataObjects.count > 0 {
            let metadataObject = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
            stringValue = metadataObject.stringValue
            if stringValue != nil{
                self.session.stopRunning()
            }
        }
        self.session.stopRunning()
        //输出结果
        let alertView = UIAlertView(title: "二维码", message: stringValue,
            delegate: self, cancelButtonTitle: "确定")
        alertView.show()
    }
```
//消息框确认后消失

```
    //消息框确认后消失
    func alertView(alertView: UIAlertView, willDismissWithButtonIndex buttonIndex: Int) {
         //继续扫描
         self.session.startRunning()
    }
```