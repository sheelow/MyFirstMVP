//
//  MainMenuPresenter.swift
//  MyFirstMVP
//
//  Created by Artem Shilov on 09.06.2022.
//

import Foundation
import UIKit

//MARK: - Protocols
protocol TableMenuViewProtocol: AnyObject {
    func configureTableView()
    func reloadTableView()
}

protocol TableMenuPresenterProtocol: AnyObject {
    var view: TableMenuViewProtocol? { get set }
    func viewDidLoad()
    func numberOfRowsInSection() -> Int
    func cellForRow(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    func didSelectRowAt(indexPath: IndexPath, _ navigationController: UINavigationController)
}

//MARK: - Presenter
final class TableMenuPresenter: TableMenuPresenterProtocol {
    
    //MARK: - Properties
    weak var view: TableMenuViewProtocol?
    private var service: NetworkServiceProtocol? = NetworkService()
    private var model: [MenuModel] = []
    
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
        cell.model = TableViewCustomCellModel(name: model[indexPath.row].name, description: model[indexPath.row].description, photo: model[indexPath.row].photo)
        cell.setContent()
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
