//
//  MainMenuPresenter.swift
//  MyFirstMVP
//
//  Created by Artem Shilov on 09.06.2022.
//

import Foundation
import UIKit

//MARK: - Protocols
protocol MainMenuViewProtocol: AnyObject {
    func configureTableView()
    func reloadTableView()
}

protocol MainMenuPresenterProtocol: AnyObject {
    var view: MainMenuViewProtocol? { get set }
    func viewDidLoad()
    func numberOfRowsInSection() -> Int
    func cellForRow(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    func didSelectRowAt(indexPath: IndexPath, _ navigationController: UINavigationController)
}

//MARK: - Presenter
final class MainMenuPresenter: MainMenuPresenterProtocol {
    
    //MARK: - Properties
    weak var view: MainMenuViewProtocol?
    private var service: NetworkService?
    private var model: [MenuModel] = []
    
    init() {
        self.service = NetworkService()
    }
    
    //MARK: - Methods
    func viewDidLoad() {
        fetchMenuData()
        view?.configureTableView()
    }
    
    func numberOfRowsInSection() -> Int {
        return model.count
    }
    
    func cellForRow(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCustomCell", for: indexPath) as! TableViewCustomCell
        cell.setContent(name: model[indexPath.row].name, description: model[indexPath.row].description, image: model[indexPath.row].photo)
        return cell
    }
    
    func didSelectRowAt(indexPath: IndexPath, _ navigationController: UINavigationController) {
        let presenter = DetailPresenter(model: model[indexPath.row])
        let vc = DetailViewController(presenter: presenter)
        navigationController.pushViewController(vc, animated: true)
    }
    
    private func fetchMenuData() {
        service?.fetchMenuData({ [weak self] menu in
            guard let self = self else { return }
            self.model = menu
        })
    }
}
