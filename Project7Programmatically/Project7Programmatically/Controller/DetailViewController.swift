//
//  DetailViewController.swift
//  Project7Programmatically
//
//  Created by Karen Vardanian on 26.03.2023.
//
import WebKit
import UIKit

class DetailViewController: UIViewController {

    var webView: WKWebView!
    var detailItem: Petition?
    
    override func loadView() {
        webView = WKWebView()
        view = webView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let detailItem = detailItem else { return }
        
        let html = """
        <html>
        <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
        body {
        font-size: 150%;
        color: blue;
        }
        h1 {
        color: mint;
        }
        h2 {
        color: gray;
        }
        </style>
        </head>
        <body>
        <h1>\(detailItem.title)</h1>
        <h2>\(detailItem.url)</h2>
        \(detailItem.body)
        </body>
        </html>
        """
        
        webView.loadHTMLString(html, baseURL: nil)
        
    }
    
    


}
