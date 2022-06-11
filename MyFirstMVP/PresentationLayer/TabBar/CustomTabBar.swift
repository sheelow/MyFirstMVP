//
//  TabBar.swift
//  MyFirstMVP
//
//  Created by Artem Shilov on 11.06.2022.
//

import UIKit

class CustomTabBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
    }
    
    private func configureTabBar() {
        tabBar.backgroundColor = .white
        
        let tableViewPresenter: MainMenuPresenterProtocol = MainMenuPresenter()
        let tableViewNavigationController = UINavigationController(rootViewController: MainMenuViewController(presenter: tableViewPresenter))
        
        let collectionViewPresenter: CollectionMenuPresenterProtocol = CollectionMenuPresenter()
        let collectionViewNavigationController = UINavigationController(rootViewController: CollectionMenuViewController(presenter: collectionViewPresenter))
        
        let profileViewPresenter: ProfilePresenterProtocol = ProfilePresenter()
        let profileViewNavigationController = UINavigationController(rootViewController: ProfileViewController(presenter: profileViewPresenter))
        
        viewControllers = [tableViewNavigationController, collectionViewNavigationController, profileViewNavigationController]
        
        tableViewNavigationController.tabBarItem = UITabBarItem.init(title: "TableView", image: .init(systemName: "menucard.fill"), tag: 0)
        collectionViewNavigationController.tabBarItem = UITabBarItem.init(title: "CollectionView", image: .init(systemName: "book.fill"), tag: 1)
        profileViewNavigationController.tabBarItem = UITabBarItem.init(title: "Profile", image: .init(systemName: "person.fill"), tag: 2)
    }
}
