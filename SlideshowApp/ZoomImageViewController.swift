//
//  ZoomImageViewController.swift
//  SlideshowApp

import UIKit

class ZoomImageViewController: UIViewController {

    // UI部品との接続
    @IBOutlet weak var DetailImage: UIScrollView!
    
    // UIimageの変数定義
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 画面の横の大きさを取得
        let widthSize = UIScreen.main.bounds.size.width
        // 拡大画像の大きさを設定(横は画面の大きさに縦は横の大きさの1.2倍)
        let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: widthSize, height: widthSize * 1.2))
        imageViewBackground.image = image
        self.view.addSubview(imageViewBackground)
    }
}
