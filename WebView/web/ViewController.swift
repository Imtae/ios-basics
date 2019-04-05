//
//  ViewController.swift
//  web
//
//  Created by 임태훈 on 29/03/2019.
//  Copyright © 2019 임태훈. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate {

    @IBOutlet var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string:"https://m.map.naver.com/search2/search.nhn?query=%ED%8E%B8%EC%9D%98%EC%A0%90&sm=hty&style=v4")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }

}

