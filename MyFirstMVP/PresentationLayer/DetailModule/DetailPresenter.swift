//
//  DetailPresenter.swift
//  MyFirstMVP
//
//  Created by Artem Shilov on 09.06.2022.
//

import Foundation
import UIKit

//MARK: - Protocols
protocol DetailViewProtocol: AnyObject {
    func setContent(title: String, description: String, image: UIImage)
}

protocol DetailPresenterProtocol: AnyObject {
    var view: DetailViewProtocol? { get set }
    func viewDidLoad()
}

//MARK: - Presenter
final class DetailPresenter: DetailPresenterProtocol {
    
    //MARK: - Properties
    weak var view: DetailViewProtocol?
    private var model: MenuModel
    
    init(model: MenuModel) {
        self.model = model
    }
    
    func viewDidLoad() {
        view?.setContent(title: model.name, description: model.description, image: model.photo)
    }
}
