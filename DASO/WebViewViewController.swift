//
//  WebViewViewController.swift
//  DASO
//
//  Created by Trinh Ta on 1/3/18.
//  Copyright © 2018 Trinh Ta. All rights reserved.
//

import UIKit
import WebKit
class WebViewViewController: UIViewController, WKUIDelegate {
    private var webView: WKWebView!;
    override func viewDidLoad() {
        super.viewDidLoad()
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
        
        let url = URL(string: "https://www.soccersmartwall.com/");
        let myRequest = URLRequest(url: url!);
        webView.load(myRequest);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 

}
