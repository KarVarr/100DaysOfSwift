//
//  SceneDelegate.swift
//  Project7Programmatically
//
//  Created by Karen Vardanian on 25.03.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        
        
//        let vc = UINavigationController(rootViewController: ViewController())
//        let table = UINavigationController(rootViewController: TabBarController())
        
        let tabBarController = createTabBarController()
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        
        window?.windowScene = windowScene
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
    
    func createVC() -> UINavigationController {
        let vc = ViewController()
        vc.title = "View Title"
        vc.tabBarItem = UITabBarItem(title: "View", image: UIImage(systemName: "doc.richtext"), tag: 0)
        return UINavigationController(rootViewController: vc)
    }
    
    func createTable() -> UINavigationController {
        let table = TableViewController(style: .insetGrouped)
        table.title = "View Title"
        table.tabBarItem = UITabBarItem(title: "Table", image: UIImage(systemName: "person.circle"), tag: 1)
        return UINavigationController(rootViewController: table)
    }
    
    func createTabBarController() -> UITabBarController {
        let tabBarController = TabBarController()
        UITabBar.appearance().backgroundColor = .gray.withAlphaComponent(0.4)
        tabBarController.viewControllers = [createVC(), createTable()]
        return tabBarController
    }
    
}

