//
//  ViewController.swift
//  original character maker
//
//  Created by 金森彦磨呂 on 2016/01/13.
//  Copyright © 2016年 金森彦磨呂. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIActionSheetDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var noseImageView: UIImageView!
    @IBOutlet var eyeImageView: UIImageView!
    @IBOutlet var hairImageView: UIImageView!
    @IBOutlet var facelineImageView: UIImageView!
    /* 使わないものは消そう！！ */
    @IBOutlet var part1Bt: UIButton!
    @IBOutlet var part2Bt: UIButton!
    @IBOutlet var part3Bt: UIButton!
    @IBOutlet var part4Bt: UIButton!
    /*ここまで*/
    @IBOutlet var myCollectionView : UICollectionView!
    
    //最初はeyeが選択されているということにして0→1に変更
    var number: Int = 1
    
    var imageArray:[String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: "longPressGesture:")
        longPressGesture.minimumPressDuration = 1.0
        longPressGesture.allowableMovement = 150
        self.view.addGestureRecognizer(longPressGesture)
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
        /* 画像の名前が変わったので配列のimageArrayの中身も変えよう！ */
        imageArray = ["eye1.png", "eye2.png","eye5.png","eye6.png", "eye7.png"]
    }
    func longPressGesture(sender: UILongPressGestureRecognizer){
        if sender.state == UIGestureRecognizerState.Began {
            let sheet: UIActionSheet = UIActionSheet()
            sheet.delegate = self
            sheet.title = "画像を保存しますか？byながた"//「byながた」消そう！笑
            sheet.addButtonWithTitle("Cancel")
            sheet.addButtonWithTitle("画像を保存")
            sheet.cancelButtonIndex = 0
            sheet.showInView(self.view)
        }
    }
    
    //MARK: collectionViewの設定
    /*
    Cellが選択された際に呼び出される
    */
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        switch number {
        case 1:
//消す            let imageName = "eye" + String(indexPath.row + 1) + ".png"
            /* imageArrayがあるのでindexPath.row番目の配列の要素(画像の名前)を取ってくるようにしよう */
            eyeImageView.image = UIImage(named: imageArray[indexPath.row])
        case 2:
//消す            let imageName = "nose" + String(indexPath.row + 1) + ".png"
            noseImageView.image = UIImage(named: imageArray[indexPath.row])
        case 3:
//消す            let imageName = "hair" + String(indexPath.row + 1) + ".png"
            hairImageView.image = UIImage(named: imageArray[indexPath.row])
        default:
            break
        }

        
    }
    
    /*
    Cellの総数を返す
    */
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    /*
    Cellに値を設定する
    */
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell : UICollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("MyCell",
            forIndexPath: indexPath)
        let imageView = cell.viewWithTag(1) as! UIImageView
        imageView.image = UIImage(named: imageArray[indexPath.row])
        
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapEyeBt(){
        //ボタンの画像を切り替える
        /* 消そう！！ */
//        part1Bt.setBackgroundImage(UIImage(named: "eye1.png"), forState: UIControlState.Normal)
//        part2Bt.setBackgroundImage(UIImage(named: "eye2.png"), forState: UIControlState.Normal)
//        part3Bt.setBackgroundImage(UIImage(named: "eye3.png"), forState: UIControlState.Normal)
//        part4Bt.setBackgroundImage(UIImage(named: "eye4.png"), forState: UIControlState.Normal)
        /* ここまで！ */
        
        /* 配列の中身を目の画像の名前に合わせた */
        imageArray = ["eye1.png", "eye2.png","eye5.png","eye6.png","eye7.png"]
        myCollectionView.reloadData()

        number = 1
        
    }
    @IBAction func tapNoseBt(){
        //ボタンの画像を切り替える
        /* 消そう */
//        part1Bt.setBackgroundImage(UIImage(named: "nose1.png"), forState: UIControlState.Normal)
//        part2Bt.setBackgroundImage(UIImage(named: "nose2.png"), forState: UIControlState.Normal)
//        part3Bt.setBackgroundImage(UIImage(named: "nose3.png"), forState: UIControlState.Normal)
//        part4Bt.setBackgroundImage(UIImage(named: "nose4.png"), forState: UIControlState.Normal)
        /* ここまで */
        
        //FIXME: 問題1 配列の中身を鼻の画像の名前に合わせよう！
        imageArray = ["nose1.png", "nose2.png","nose3.png","nose4.png"]
        myCollectionView.reloadData()

        number = 2
        
    }
    
    //FIXME: 問題2 ボタンの名前を変えよう！HairをMouthにするなど
    @IBAction func tapHairBt(){
        //ボタンの画像を切り替える
        /* 消そう */
//        part1Bt.setBackgroundImage(UIImage(named: "hair1.png"), forState: UIControlState.Normal)
//        part2Bt.setBackgroundImage(UIImage(named: "hair2.png"), forState: UIControlState.Normal)
//        part3Bt.setBackgroundImage(UIImage(named: "hair3.png"), forState: UIControlState.Normal)
//        part4Bt.setBackgroundImage(UIImage(named: "hair4.png"), forState: UIControlState.Normal)
        /* ここまで */
        
        //FIXME: 問題3 配列の中身を口の画像の名前に合わせよう(髪の画像は今無いので)
        imageArray = ["hair1.png", "hair2.png","hair3.png","hair4.png"]
        myCollectionView.reloadData()

        number = 3
        
    }
    
    //FIXME: 問題4 eyebrowsのボタンも追加しよう！
    
    
/* いらないものは消そう！*/
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
/* ここまで */
    
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        if buttonIndex == 1 {
            UIGraphicsBeginImageContextWithOptions(CGSizeMake(288, 288), true,0)
            let imageArray: [UIImageView?] = [facelineImageView, noseImageView,hairImageView,eyeImageView]
            for item in imageArray{
                let image = item?.image
                image!.drawInRect(item!.frame)
            }
            let faceImage = UIGraphicsGetImageFromCurrentImageContext()
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
        let faceImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        UIImageWriteToSavedPhotosAlbum(faceImage, nil, nil, nil)
    }
    
    /* いらないものは消そう！*/
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
    /* ここまで */
    
    
    
}

