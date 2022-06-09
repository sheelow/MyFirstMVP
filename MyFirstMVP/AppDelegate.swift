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
        
        let tabBarController = UITabBarController()
        
        let firstPresenter: MainMenuPresenterProtocol = MainMenuPresenter()
        let firstNC = UINavigationController(rootViewController: MainMenuViewController(presenter: firstPresenter))
        
        let secondPresenter: CollectionMenuPresenterProtocol = CollectionMenuPresenter()
        let secondNC = UINavigationController(rootViewController: CollectionMenuViewController(presenter: secondPresenter))
        
        let thirdPresenter: ProfilePresenterProtocol = ProfilePresenter()
        let thirdNC = UINavigationController(rootViewController: ProfileViewController(presenter: thirdPresenter))
        
        tabBarController.viewControllers = [firstNC, secondNC, thirdNC]
        
        firstNC.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        secondNC.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
        thirdNC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 2)
        
        window?.rootViewController = tabBarController
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        
        return true
    }
}

