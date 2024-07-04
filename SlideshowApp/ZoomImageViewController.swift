//
//  ZoomImageViewController.swift
//  SlideshowApp
//
//  Created by WEBSYSTEM-MAC41 on 2024/07/03.
//

import UIKit

class ZoomImageViewController: UIViewController {

    @IBOutlet weak var DetailImage: UIScrollView!
    
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let widthSize = UIScreen.main.bounds.size.width // 画面の横の大きさを取得
        let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: widthSize, height: widthSize * 1.2)) // 背景画像の大きさを設定
        imageViewBackground.image = image // 画像を設定
        self.view.addSubview(imageViewBackground) // 背景画像を追加する
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
