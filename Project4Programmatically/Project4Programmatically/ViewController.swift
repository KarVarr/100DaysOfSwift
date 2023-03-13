//
//  ViewController.swift
//  Project4Programmatically
//
//  Created by Karen Vardanian on 13.03.2023.
//
import WebKit
import UIKit

class ViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!

    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "WEB KIT"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let url = URL(string: "https://www.apple.com")
        webView.load(URLRequest(url: url!))
        webView.allowsBackForwardNavigationGestures = true
    }


}

