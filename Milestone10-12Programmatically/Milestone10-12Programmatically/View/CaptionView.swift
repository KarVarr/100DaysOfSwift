//
//  CaptionView.swift
//  Milestone10-12Programmatically
//
//  Created by Karen Vardanian on 24.04.2023.
//

import UIKit

class CaptionView {
    var label: UILabel = {
       var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false 
        
        label.font = UIFont(name: "AppleSDGothicNeo-Light" , size: 24)
        return label
    }()
}

