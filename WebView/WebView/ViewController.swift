//
//  ViewController.swift
//  WebView
//
//  Created by 임태훈 on 25/04/2019.
//  Copyright © 2019 임태훈. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {

    @IBOutlet var webView: WKWebView!
    @IBOutlet var textUrl: UITextField!
    @IBOutlet var ac: UIActivityIndicatorView!
    
    func loadWebPage(_ url:String) {
        let url = URL(string: url)
        let request = URLRequest(url: url!)
        
        webView.load(request)
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.isLoading), options: .new, context: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadWebPage("http://wavy.kr")
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if (keyPath == "loading") {
            if (webView.isLoading) {
                ac.startAnimating()
                ac.isHidden = false
            } else {
                ac.stopAnimating()
                ac.isHidden = true
            }
        }
    }
    
    func checkUrl(_ url:String) -> String {
        var strUrl = url;
        let flag = strUrl.hasPrefix("http://")
        
        if (!flag) {
            strUrl = "http://" + url
        }
        return strUrl
    }
    
    @IBAction func btnGo(_ sender: UIButton) {
        let url = checkUrl(textUrl.text!)
        
        textUrl.text = ""
        loadWebPage(url)
    }
    
    @IBAction func btnGoSite1(_ sender: UIButton) {
        loadWebPage("http://colde.wavy.kr")
    }
    @IBAction func btnGoSite2(_ sender: UIButton) {
        loadWebPage("http://imtae.com")
    }
    @IBAction func btnGoHtml(_ sender: UIButton) {
        let htmlString = "<h1>Hello world!</>"
        
        webView.loadHTMLString(htmlString, baseURL: nil)
    }
    @IBAction func btnGoFile(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "file", ofType: "html")
        let url = URL(fileURLWithPath: filePath!)
        let request = URLRequest(url: url)
        
        webView.load(request)
    }
    
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        webView.stopLoading()
    }
    @IBAction func btnReFresh(_ sender: UIBarButtonItem) {
        webView.reload()
    }
    @IBAction func btnBefore(_ sender: UIBarButtonItem) {
        webView.goBack()
    }
    @IBAction func btnAfter(_ sender: UIBarButtonItem) {
        webView.goForward()
    }
}
