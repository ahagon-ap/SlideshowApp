//
//  ViewController.swift
//  SlideshowApp

import UIKit

class ViewController: UIViewController {
    
    // UI部品との接続
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var dogImages: UIImageView!
    
    // 配列に指定するindex番号を宣言
    var nowIndex:Int = 0
    
    // スライドショーに使用するタイマーを宣言
    var timer: Timer!
    
    // スライドショーさせる画像の配列を宣言
    var imageArray:[UIImage] = [
        UIImage(named: "dog1.jpg")!,
        UIImage(named: "dog2.jpg")!,
        UIImage(named: "dog3.jpg")!,
        UIImage(named: "dog4.jpg")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 最初に使用する画像の説明
        let firstImage = UIImage(named: "dog1.jpg")
        dogImages.image = firstImage
        dogImages.isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:)))
        dogImages.addGestureRecognizer(tapGestureRecognizer)
    }
    
    //  画像がタップされた時の関数
    @objc func imageViewTapped(_ sender: UITapGestureRecognizer) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        // 2つ目の画面にタップした画像のデータを送る
        if let detailVC = storyboard.instantiateViewController(withIdentifier: "ZoomImageViewController") as? ZoomImageViewController {
            detailVC.image = dogImages.image
            self.present(detailVC, animated: true, completion: nil)
        }
    }
    
    // 再生ボタンを押した時の関数
    @IBAction func start(_ sender: Any) {
        // 再生中か停止しているかを判定
        if (timer == nil) {
            // 再生時の処理
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImageAutomatically), userInfo: nil, repeats: true)
            
            // ボタンの名前を停止に変える
            startButton.setTitle("停止", for: .normal)
            // ボタンを操作不可に
            goButton.isEnabled = false
            backButton.isEnabled = false
            
        } else {
            // 停止時の処理を実装
            timer.invalidate()
            
            // タイマーの削除
            timer = nil
            
            // ボタンの名前を再生に変える
            startButton.setTitle("再生", for: .normal)
            // ボタンを操作可能に
            goButton.isEnabled = true
            backButton.isEnabled = true
            
        }
    }
    
    // 進むボタン
    @IBAction func go(_ sender: Any) {
        changeImage(direction: "plus")
    }
    
    // 戻るボタン
    @IBAction func back(_ sender: Any) {
        changeImage(direction: "minus")
    }
    
    // セレクタに入れるため
    @objc func changeImageAutomatically() {
        changeImage(direction: "plus")
    }
    
    // 画像の遷移する順番
    @objc func changeImage(direction: String) {
        
        // 再生ボタンと進むボタンの時の挙動
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
        
        // 表示する画像の確定
        dogImages.image = imageArray[nowIndex]
    }
    
    // 2つ目の画像の戻るボタン用
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
}

