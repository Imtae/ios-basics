//
//  DatePickerViewController.swift
//  TabBar
//
//  Created by 임태훈 on 17/05/2019.
//  Copyright © 2019 임태훈. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btn1(_ sender: UIButton) {
        tabBarController?.selectedIndex = 0
    }
    
    @IBAction func btn2(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
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
