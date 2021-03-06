//
//  ViewController.swift
//  HelloWorld
//
//  Created by 임태훈 on 15/03/2019.
//  Copyright © 2019 임태훈. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //    @IBOutlet: Main.storyboard와 연결
    @IBOutlet var lblHello: UILabel!
    @IBOutlet var txtName: UITextField!
    @IBOutlet var lblHelloWorld: UILabel!
    
    //    viewDidLoad: 로드될 때 한 번만 동작
    override func viewDidLoad() {
        super.viewDidLoad()
        lblHelloWorld.text = "Hello world!!!!"
    }

    @IBAction func btnSend(_ sender: UIButton) {
        lblHello.text = "Hello, " + txtName.text!
    }
    
}
