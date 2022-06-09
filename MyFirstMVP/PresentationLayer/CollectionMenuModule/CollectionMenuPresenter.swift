//
//  CollectionMenuPresenter.swift
//  MyFirstMVP
//
//  Created by Artem Shilov on 09.06.2022.
//

import Foundation

//MARK: - Protocols
protocol CollectionMenuViewProtocol: AnyObject {
    
    func setupTableView()
    func reloadTableView()
}

protocol CollectionMenuPresenterProtocol: AnyObject {
    var view: CollectionMenuViewProtocol? { get set }
    
}

//MARK: - Presenter
class CollectionMenuPresenter: CollectionMenuPresenterProtocol {
    
    //MARK: - Properties
    weak var view: CollectionMenuViewProtocol?
    
    
}
