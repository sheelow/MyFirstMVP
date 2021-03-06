//
//  CollectionMenuPresenter.swift
//  MyFirstMVP
//
//  Created by Artem Shilov on 09.06.2022.
//

import Foundation
import UIKit

//MARK: - Protocols
protocol CollectionMenuViewProtocol: AnyObject {
    func configureCollectionView()
    func reloadCollectionView()
}

protocol CollectionMenuPresenterProtocol: AnyObject {
    var view: CollectionMenuViewProtocol? { get set }
    func viewDidLoad()
    func numberOfRowsInSection() -> Int
    func cellForItemAt(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    func didSelectItemAt(indexPath: IndexPath, _ navigationController: UINavigationController)
    func toProfileScreen(navigationController: UINavigationController)
}

//MARK: - Presenter
final class CollectionMenuPresenter: CollectionMenuPresenterProtocol {
    
    //MARK: - Properties
    weak var view: CollectionMenuViewProtocol?
    private var service: NetworkServiceProtocol? = NetworkService()
    private var model: [MenuModel] = []
    
    //MARK: - Methods
    func viewDidLoad() {
        fetchMenuData()
        view?.configureCollectionView()
    }
    
    func numberOfRowsInSection() -> Int {
        return model.count
    }
    
    func cellForItemAt(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCustomCell", for: indexPath) as! CollectionViewCustomCell
        cell.model = CollectionViewCustomCellModel(name: model[indexPath.row].name, photo: model[indexPath.row].photo)
        cell.setContent()
        return cell
    }
    
    func didSelectItemAt(indexPath: IndexPath, _ navigationController: UINavigationController) {
        let presenter = DetailPresenter(model: model[indexPath.row])
        let vc = DetailViewController(presenter: presenter)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func toProfileScreen(navigationController: UINavigationController) {
        let presenter = ProfilePresenter()
        let vc = ProfileViewController(presenter: presenter)
        navigationController.pushViewController(vc, animated: true)
    }
    
    private func fetchMenuData() {
        service?.fetchMenuData({ [weak self] menu in
            guard let self = self else { return }
            self.model = menu
        })
    }
}
