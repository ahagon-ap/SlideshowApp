//
//  ZoomImageViewController.swift
//  SlideshowApp

import UIKit

class ZoomImageViewController: UIViewController {

    // UI部品との接続
    @IBOutlet weak var detailImage: UIImageView!
    
    // UIimageの変数定義
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailImage.image = image
    }
}
