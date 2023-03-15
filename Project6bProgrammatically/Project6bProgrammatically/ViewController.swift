//
//  ViewController.swift
//  Project6bProgrammatically
//
//  Created by Karen Vardanian on 15.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let label1: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .red
        label.text = "THERE"
        label.sizeToFit()
        return label
    }()
    
    let label2: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .cyan
        label.text = "ARE"
        label.sizeToFit()
        return label
    }()
    
    let label3: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .yellow
        label.text = "SOME"
        label.sizeToFit()
        return label
    }()
    
    let label4: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .green
        label.text = "AWESOME"
        label.sizeToFit()
        return label
    }()
    
    let label5: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .orange
        label.text = "LABELS"
        label.sizeToFit()
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        addView()
        layout()
    }
    
    func addView() {
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(label3)
        view.addSubview(label4)
        view.addSubview(label5)
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            
        ])
    }


}

