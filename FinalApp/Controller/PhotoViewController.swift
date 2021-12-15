//
//  PhotoViewController.swift
//  FinalApp
//
//  Created by AW on 12/14/21.
//

import UIKit
import SDWebImage

class PhotoViewController : UIViewController {
    
    @IBOutlet weak var myImageView: UIImageView!
    var url = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        myImageView.sd_setImage(with: URL(string: url))
    }
}
