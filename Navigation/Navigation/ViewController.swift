//
//  ViewController.swift
//  Navigation
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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let ctrl = segue.destination as!EditViewController
        
        if (segue.identifier == "editButton") {
            ctrl.textWayValue = "segue: use button"
        } else if (segue.identifier == "editBarButton") {
            ctrl.textWayValue = "segue: use bar button"
        }
    }

}

