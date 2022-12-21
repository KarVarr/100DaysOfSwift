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

        // Do any additional setup after loading the view.
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
