//
//  ViewController.swift
//  HelloWorld
//
//  Created by 임태훈 on 15/03/2019.
//  Copyright © 2019 임태훈. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lblHello: UILabel!
    @IBOutlet var txtName: UITextField!
    @IBOutlet var lblHelloWorld: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblHelloWorld.text = "Hello world!!!!"
    }

    @IBAction func btnSend(_ sender: UIButton) {
        lblHello.text = "Hello, " + txtName.text!
    }
}
