//
//  WebView.swift
//  Project16Programmatically
//
//  Created by Karen Vardanian on 01.05.2023.
//
import WebKit
import UIKit


class WebView {
    let myWeb: WKWebView = {
       let web = WKWebView()
        web.translatesAutoresizingMaskIntoConstraints = false 
        return web
    }()
}
