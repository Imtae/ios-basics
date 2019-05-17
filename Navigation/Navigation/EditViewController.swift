//
//  EditViewController.swift
//  Navigation
//
//  Created by 임태훈 on 17/05/2019.
//  Copyright © 2019 임태훈. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    var textWayValue:String = ""
    
//    Outlet 변수는 화면이 떠야 생성이 됨
//    ViewController에서 textWavyValue 변수를 사용하는 이유
    @IBOutlet var lblWay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblWay.text = textWayValue
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
