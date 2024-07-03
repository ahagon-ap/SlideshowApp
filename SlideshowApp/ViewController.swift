//
//  ViewController.swift
//  SlideshowApp
//
//  Created by WEBSYSTEM-MAC41 on 2024/07/02.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var dogImages: UIImageView!
    
    // 配列に指定するindex番号を宣言
    var nowIndex:Int = 0
    
    // スライドショーに使用するタイマーを宣言
    var timer: Timer!
    
    var go: String = "plus"
    
    var back: String = "minus"
    
    // スライドショーさせる画像の配列を宣言
    var imageArray:[UIImage] = [
        UIImage(named: "dog1.jpg")!,
        UIImage(named: "dog2.jpg")!,
        UIImage(named: "dog3.jpg")!,
        UIImage(named: "dog4.jpg")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let firstImage = UIImage(named: "dog1.jpg")
        dogImages.image = firstImage
        dogImages.isUserInteractionEnabled = true
        dogImages.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:))))
    }
    
    @objc func imageViewTapped(_ sender: UITapGestureRecognizer) {
        
    }
    
    @IBAction func start(_ sender: Any) {
        // 再生中か停止しているかを判定
        if (timer == nil) {
            // 再生時の処理を実装
            // タイマーをセットする
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImageAutomatically), userInfo: nil, repeats: true)
            
            // ボタンの名前を停止に変える
            startButton.setTitle("停止", for: .normal)
            
            goButton.isEnabled = false
            backButton.isEnabled = false
            
        } else {
            // 停止時の処理を実装
            // タイマーを停止する
            timer.invalidate()
            
            // タイマーを削除しておく(timer.invalidateだけだとtimerがnilにならないため)
            timer = nil
            
            // ボタンの名前を再生に変える
            startButton.setTitle("再生", for: .normal)
            
            goButton.isEnabled = true
            backButton.isEnabled = true
            
        }
    }
    
    @IBAction func go(_ sender: Any) {
        changeImage(direction: "plus")
    }
    
    @IBAction func back(_ sender: Any) {
        changeImage(direction: "minus")
    }
    
    @objc func changeImageAutomatically() {
        changeImage(direction: "plus")
    }
    
    @objc func changeImage(direction: String) {
        
        if (direction == "plus"){
            
            // indexを増やして表示する画像を切り替える
            nowIndex += 1
            
            // indexが表示予定の画像の数と同じ場合
            if (nowIndex == imageArray.count) {
                // indexを一番最初の数字に戻す
                nowIndex = 0
            }
        } else {
            
            // indexを増やして表示する画像を切り替える
            nowIndex -= 1
            
            // indexが表示予定の画像の数と同じ場合
            if (nowIndex < 0) {
                // indexを一番最初の数字に戻す
                nowIndex = imageArray.count - 1
            }
        }
        dogImages.image = imageArray[nowIndex]
    }
    
}

