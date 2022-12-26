//
//  DetailViewController.swift
//  Project7
//
//  Created by Karen Vardanian on 21.12.2022.
//

import UIKit
import WebKit


class DetailViewController: UIViewController {
    var wevView: WKWebView!
    var detailItem: Petition?
    
    override func viewDidLoad() {
        wevView = WKWebView()
        super.viewDidLoad()
        
        guard let detailItem = detailItem else { return }
        
        let html = """
        <html>
        <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style> body { font-size: 150%; } </style>
        </head>
        <body>
        \(detailItem.body)
        </body>
        </html>
        """
        
        
        wevView.loadHTMLString(html, baseURL: nil)
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
