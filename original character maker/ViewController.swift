//
//  ViewController.swift
//  original character maker
//
//  Created by 金森彦磨呂 on 2016/01/13.
//  Copyright © 2016年 金森彦磨呂. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIActionSheetDelegate {
    
    @IBOutlet var noseImageView: UIImageView!
    @IBOutlet var eyeImageView: UIImageView!
    @IBOutlet var hairImageView: UIImageView!
    @IBOutlet var facelineImageView: UIImageView!
    @IBOutlet var part1Bt: UIButton!
    @IBOutlet var part2Bt: UIButton!
    @IBOutlet var part3Bt: UIButton!
    @IBOutlet var part4Bt: UIButton!
    
    var number: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: "longPressGesture:")
        longPressGesture.minimumPressDuration = 1.0
        longPressGesture.allowableMovement = 150
        self.view.addGestureRecognizer(longPressGesture)
    }
    func longPressGesture(sender: UILongPressGestureRecognizer){
        if sender.state == UIGestureRecognizerState.Began {
            let sheet: UIActionSheet = UIActionSheet()
            sheet.delegate = self
            sheet.title = "画像を保存しますか？byながた"
            sheet.addButtonWithTitle("Cancel")
            sheet.addButtonWithTitle("画像を保存")
            sheet.cancelButtonIndex = 0
            sheet.showInView(self.view)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapEyeBt(){
        //ボタンの画像を切り替える
        part1Bt.setBackgroundImage(UIImage(named: "eye1.png"), forState: UIControlState.Normal)
        part2Bt.setBackgroundImage(UIImage(named: "eye2.png"), forState: UIControlState.Normal)
        part3Bt.setBackgroundImage(UIImage(named: "eye3.png"), forState: UIControlState.Normal)
        part4Bt.setBackgroundImage(UIImage(named: "eye4.png"), forState: UIControlState.Normal)
        number = 1
        
    }
    @IBAction func tapNoseBt(){
        //ボタンの画像を切り替える
        part1Bt.setBackgroundImage(UIImage(named: "nose1.png"), forState: UIControlState.Normal)
        part2Bt.setBackgroundImage(UIImage(named: "nose2.png"), forState: UIControlState.Normal)
        part3Bt.setBackgroundImage(UIImage(named: "nose3.png"), forState: UIControlState.Normal)
        part4Bt.setBackgroundImage(UIImage(named: "nose4.png"), forState: UIControlState.Normal)
        number = 2
        
    }
    @IBAction func tapHairBt(){
        //ボタンの画像を切り替える
        part1Bt.setBackgroundImage(UIImage(named: "hair1.png"), forState: UIControlState.Normal)
        part2Bt.setBackgroundImage(UIImage(named: "hair2.png"), forState: UIControlState.Normal)
        part3Bt.setBackgroundImage(UIImage(named: "hair3.png"), forState: UIControlState.Normal)
        part4Bt.setBackgroundImage(UIImage(named: "hair4.png"), forState: UIControlState.Normal)
        number = 3
        
    }
    
    @IBAction func tapPart1Bt(sender: UIButton){
        
        
        switch number {
        case 1:
            let imageName = "eye" + String(sender.tag) + ".png"
            eyeImageView.image = UIImage(named: imageName)
        case 2:
            let imageName = "nose" + String(sender.tag) + ".png"
            noseImageView.image = UIImage(named: imageName)
        case 3:
            let imageName = "hair" + String(sender.tag) + ".png"
            hairImageView.image = UIImage(named: imageName)
        default:
            break
        }
        
        
    }
    
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        if buttonIndex == 1 {
            UIGraphicsBeginImageContextWithOptions(CGSizeMake(288, 288), true,0)
            let imageArray: [UIImageView?] = [facelineImageView, noseImageView,hairImageView,eyeImageView]
            for item in imageArray{
                let image = item?.image
                image!.drawInRect(item!.frame)
            }
            var faceImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            UIImageWriteToSavedPhotosAlbum(faceImage, nil, nil, nil)
        }
        
    }
    
    //保存ボタンを押したら
    @IBAction func tapImageBt(){
        //ビットマップ形式のグラフィックスコンテキストの生成
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(288, 288), true,0)
        let imageArray: [UIImageView?] = [facelineImageView, noseImageView,hairImageView,eyeImageView]
        for item in imageArray{
            let image = item?.image
            image!.drawInRect(item!.frame)
        }
        var faceImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        UIImageWriteToSavedPhotosAlbum(faceImage, nil, nil, nil)
    }
    //    @IBAction func tapPart2Bt(){
    //        switch number {
    //        case 1:
    //            eyeImageView.image = UIImage(named: "eye2.png")
    //        case 2:
    //            noseImageView.image = UIImage(named: "nose2.png")
    //        case 3:
    //            hairImageView.image = UIImage(named: "hair2.png")
    //        default:
    //            break
    //        }
    
    //    }
    
    
    
    
}

