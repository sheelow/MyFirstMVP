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
        
        let collectionViewPresenter: CollectionMenuPresenterProtocol = CollectionMenuPresenter()
        let collectionViewNavigationController = UINavigationController(rootViewController: CollectionMenuViewController(presenter: collectionViewPresenter))
        
        let tableViewPresenter: TableMenuPresenterProtocol = TableMenuPresenter()
        let tableViewNavigationController = UINavigationController(rootViewController: TableMenuViewController(presenter: tableViewPresenter))
        
//        let profileViewPresenter: ProfilePresenterProtocol = ProfilePresenter()
        let profileViewNavigationController = UINavigationController(rootViewController: FavoritesViewController())
        
        viewControllers = [collectionViewNavigationController, tableViewNavigationController, profileViewNavigationController]
        
        collectionViewNavigationController.tabBarItem = UITabBarItem.init(title: "CollectionView", image: .init(systemName: "book.fill"), tag: 0)
        tableViewNavigationController.tabBarItem = UITabBarItem.init(title: "TableView", image: .init(systemName: "menucard.fill"), tag: 1)
        profileViewNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 2)
    }
}
