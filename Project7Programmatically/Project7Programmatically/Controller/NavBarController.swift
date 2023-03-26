//
//  NavBarController.swift
//  Project7Programmatically
//
//  Created by Karen Vardanian on 25.03.2023.
//

import UIKit

class NavBarController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //configureAppearance()
    }
    
    private func configureAppearance() {
        view.backgroundColor = .white
        navigationBar.isTranslucent = false
        navigationBar.standardAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.blue,
        ]
    }
  

}
