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
    var progressView: UIProgressView!
    let websites = ["yandex.ru","apple.com", "google.com", "facebook.com", "yahoo.com", "microsoft.com"]
    
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addView()
        setting()
        layout()
        
        
        
        let url = URL(string: "https://www.\(websites.first!)")
        webView.load(URLRequest(url: url!))
        webView.allowsBackForwardNavigationGestures = true
    }
    
    func addView() {
        
    }
    
    func setting() {
        webView.translatesAutoresizingMaskIntoConstraints = false
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))
        
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.sizeToFit()
        let progressButton = UIBarButtonItem(customView: progressView)
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector( webView.reload))
        //Challenge 2
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: webView, action: #selector(webView.goBack))
        let forwardButton = UIBarButtonItem(title: "Forward", style: .plain, target: webView, action: #selector(webView.goForward))
        toolbarItems = [progressButton, spacer,backButton, forwardButton, refresh]
        navigationController?.isToolbarHidden = false
        
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        
    }
    func layout() {
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            webView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
            
        ])
    }
    
    
    
    @objc func openTapped() {
        let ac = UIAlertController(title: "Open page", message: nil, preferredStyle: .actionSheet)
        for website in websites {
            ac.addAction(UIAlertAction(title: website, style: .default, handler: openPage))
        }
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        ac.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(ac, animated: true)
    }
    
    func openPage(action: UIAlertAction) {
        guard let actionTitle = action.title else {return}
        //Challenge 1
        if actionTitle == "apple.com" {
            let ac = UIAlertController(title: "WARNING", message: "This site is banned!", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .cancel))
            present(ac, animated: true)
            return
        }
        guard let url = URL(string: "https://www.\(actionTitle)") else {return}
        
        webView.load(URLRequest(url: url))
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        progressView.progress = Float(webView.estimatedProgress)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let url = navigationAction.request.url
        
        if let host = url?.host {
            for website in websites {
                if host.contains(website) {
                    decisionHandler(.allow)
                    return
                }
            }
        }
        decisionHandler(.cancel)
    }
    
}

