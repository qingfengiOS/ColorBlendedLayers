//
//  ViewController.swift
//  ColorBlendedLayers
//
//  Created by qingfengiOS on 2018/6/11.
//  Copyright © 2018年 slwy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var blueView: UIView!
    
    @IBOutlet weak var testImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
         UIView有一个叫做alpha的属性来确定视图的透明度。CALayer有一个等同的属性叫做opacity，这两个属性都是影响子层级的。也就是说，如果你给一个图层设置了opacity属性，那它的子图层都会受此影响。
         
         当你显示一个50%透明度的图层时，图层的每个像素都会一半显示自己的颜色，另一半显示图层下面的颜色。这是正常的透明度的表现。但是如果图层包含一个同样显示50%透明的子图层时，你所看到的视图，50%来自子视图，25%来了图层本身的颜色，另外的25%则来自背景色。
         
         所以我们要尽量避免设置alpha，这样GPU会忽略下面所有的layer，节约计算量。
         */
        blueView.alpha = 1
        
        /*
         测试方式：
         选中模拟器——>选择Debug——>勾选Color Blended Layers
         （alpha = 0.5时blueView为红色，alpha = 1时blueView为绿色）
         */
        
        
        let image: UIImage = (UIImage.init(named: "train"))!
        testImageView.image = image.scaleImage(size: testImageView.frame.size)
        /*
         使用Core Graphics缩放图片,处理Color Misaligned Images
         */
    }
}

extension UIImage {
    func scaleImage(size: CGSize) -> UIImage? {
        
        if self.size.equalTo(size) {
            return self;
        }
        
        UIGraphicsBeginImageContextWithOptions(size, true, UIScreen.main.scale)
        self.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        return newImage
    }
}
