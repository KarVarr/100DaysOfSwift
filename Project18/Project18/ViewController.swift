//
//  ViewController.swift
//  Project18
//
//  Created by Karen Vardanian on 20.01.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("I'm inside in viewDidLoad", terminator: "")
        print(1,2,3,4,5, separator: "###")
        
        assert(1 == 3, "not correct")
    }


}

