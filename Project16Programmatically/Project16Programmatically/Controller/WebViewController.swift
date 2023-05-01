//
//  WebViewController.swift
//  Project16Programmatically
//
//  Created by Karen Vardanian on 01.05.2023.
//
import WebKit
import UIKit

class WebViewController: UIViewController, WKNavigationDelegate {
    
    let web = WebView()
    var toolbar = UIToolbar()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray
        addView()
        setting()
        layout()
        addToolbarItems()
    }
    
    
    func addView() {
        view.addSubview(web.myWeb)
        view.addSubview(toolbar)
    }
    
    func setting() {
        web.myWeb.navigationDelegate = self
        web.myWeb.allowsBackForwardNavigationGestures = true
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            web.myWeb.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            web.myWeb.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            web.myWeb.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            web.myWeb.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func addToolbarItems() {
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(goBack))
        let forwardButton = UIBarButtonItem(image: UIImage(systemName: "chevron.forward"), style: .plain, target: self, action: #selector(goForward))
        
        toolbar.frame = CGRect(x: 0, y: view.bounds.height - 60, width: view.bounds.width, height: 60)
        toolbar.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        toolbar.items = [backButton, UIBarButtonItem.fixedSpace(30), forwardButton]
        
    }

    @objc func goBack() {
        if web.myWeb.canGoBack {
            web.myWeb.goBack()
        }
    }
    @objc func goForward() {
        if web.myWeb.canGoForward {
            web.myWeb.goForward()
        }
        
    }
    
    

}
