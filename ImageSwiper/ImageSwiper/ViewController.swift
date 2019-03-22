//
//  ViewController.swift
//  ImageSwiper
//
//  Created by 임태훈 on 22/03/2019.
//  Copyright © 2019 임태훈. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var imgArr = ["01.png", "02.png", "03.png", "04.png", "05.png", "06.png"]
    var num = 0

    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.image = UIImage(named: imgArr[num])
    }

    @IBAction func prevButton(_ sender: UIButton) {
        if (num != 0) {
            num -= 1
        } else {
            num = 5
        }
        imgView.image = UIImage(named: imgArr[num])
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        if (num != 5) {
            num += 1
        } else {
            num = 0
        }
        imgView.image = UIImage(named: imgArr[num])
    }
    
}
