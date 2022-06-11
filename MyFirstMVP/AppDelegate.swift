//
//  AppDelegate.swift
//  MyFirstMVP
//
//  Created by Artem Shilov on 09.06.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let tabBarController = CustomTabBar()
        tabBarController.selectedIndex = 0
        
        window?.rootViewController = tabBarController
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        
        return true
    }
}

