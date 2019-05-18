//
//  ViewController.swift
//  TabBar
//
//  Created by 임태훈 on 17/05/2019.
//  Copyright © 2019 임태훈. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btn1(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1;
    }
    
    @IBAction func btn2(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }

}

