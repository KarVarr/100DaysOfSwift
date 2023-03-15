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
        label.textAlignment = .center
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
        view.backgroundColor = .systemTeal
        
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
        //Challenge 1,2,3
            NSLayoutConstraint.activate([
                label1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
                label1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                label1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                label1.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1, constant: 2),
                
                label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 10),
                label2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                label2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                label2.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1, constant: 2),
                
                label3.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 10),
                label3.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                label3.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                label3.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1, constant: 2),
                
                label4.topAnchor.constraint(equalTo: label3.bottomAnchor, constant: 10),
                label4.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                label4.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                label4.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1, constant: 2),
                
                label5.topAnchor.constraint(equalTo: label4.bottomAnchor, constant: 10),
                label5.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                label5.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                label5.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1, constant: 2),
            ])
        }
    
    
    
}

