//
//  ViewController.swift
//  WebKit Example
//
//  Created by Kamrul on 9/8/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController,WKNavigationDelegate {
    
    var webView: WKWebView!{
        didSet {
            let refreshControl = UIRefreshControl()
            refreshControl.addTarget(self, action: #selector(reload(_:)), for: .valueChanged)
            webView.scrollView.refreshControl = refreshControl
        }
    }

    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        I just love this site so I am using this URL.
        let url = URL(string: "https://learnappmaking.com")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }

    @objc private func reload(_ refreshControl: UIRefreshControl) {
        refreshControl.endRefreshing()
        print("webView.reload()")
        webView.reload()
    }

}

