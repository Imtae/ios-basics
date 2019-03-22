//
//  ViewController.swift
//  ImageView
//
//  Created by 임태훈 on 22/03/2019.
//  Copyright © 2019 임태훈. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isZoom = false;
    var imgOn: UIImage?
    var imgOff: UIImage?
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var btnResize: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgOn = UIImage(named: "lamp_on.png")
        imgOff = UIImage(named: "lamp_off.png")
        
        imgView.image = imgOn;
    }

    
    @IBAction func btnResizeImage(_ sender: UIButton) {
        let scale:CGFloat = 2.0
        var newWidth: CGFloat, newHeight: CGFloat
        
        if (isZoom) {
            newWidth = imgView.frame.width / scale
            newHeight = imgView.frame.height / scale
            imgView.frame.size = CGSize(width: newWidth, height: newHeight)
            btnResize.setTitle("확대", for: .normal)
        } else {
            newWidth = imgView.frame.width * scale
            newHeight = imgView.frame.height * scale
            imgView.frame.size = CGSize(width: newWidth, height: newHeight)
            btnResize.setTitle("축소", for: .normal)
        }
        isZoom = !isZoom
    }
    
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        if (sender.isOn) {
            imgView.image = imgOn
        } else {
            imgView.image = imgOff
        }
    }
    
}

