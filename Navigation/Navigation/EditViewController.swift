//
//  EditViewController.swift
//  Navigation
//
//  Created by 임태훈 on 17/05/2019.
//  Copyright © 2019 임태훈. All rights reserved.
//

import UIKit

protocol EditDelegate {
    func didMessageEditDone(_ controller: EditViewController, message: String)
    func didSwitchChangeDone(_ controller: EditViewController, isOn: Bool)
}

class EditViewController: UIViewController {
    var textWayValue: String = ""
    var textMessage: String = ""
    var delegate: EditDelegate?
    var isOn = false
    
    @IBOutlet var lblMessage: UILabel!
    @IBOutlet var textField: UITextField!
    @IBOutlet var switchEl: UISwitch!
    
    
//    Outlet 변수는 화면이 떠야 생성이 됨
//    ViewController에서 textWavyValue 변수를 사용하는 이유
    @IBOutlet var lblWay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblWay.text = textWayValue
        textField.text = textMessage
        switchEl.isOn = isOn
    }

    @IBAction func btnDone(_ sender: UIButton) {
        if (delegate != nil) {
            delegate?.didMessageEditDone(self, message: textField.text ?? "")
            delegate?.didSwitchChangeDone(self, isOn: isOn)
        }
        _ = navigationController?.popViewController(animated: true)
    }

    @IBAction func switchLamp(_ sender: UISwitch) {
        if (sender.isOn) {
            isOn = true
        } else {
            isOn = false
        }
    }
    
}
