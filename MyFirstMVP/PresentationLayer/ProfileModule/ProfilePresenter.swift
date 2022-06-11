//
//  ProfilePresenter.swift
//  MyFirstMVP
//
//  Created by Artem Shilov on 09.06.2022.
//

import Foundation
import UIKit

//MARK: - Protocols
protocol ProfileViewProtocol: AnyObject {
    func setContent(name: String, lastName: String, phone: String, email: String, image: UIImage)
    func updateContent()
}

protocol ProfilePresenterProtocol: AnyObject {
    var view: ProfileViewProtocol? { get set }
    func viewDidLoad()
    func getData()
}

//MARK: - Presenter
final class ProfilePresenter: ProfilePresenterProtocol {
    
    //MARK: - Properties
    weak var view: ProfileViewProtocol?
    private var service: NetworkService?
    private var model: UserModel = UserModel(name: "", lastName: "", phone: "", email: "", avatar: UIImage(imageLiteralResourceName: "ava"))
    
    init() {
        self.service = NetworkService()
    }
    
    func viewDidLoad() {
        fetchUserData()
    }
    
    func getData() {
        view?.setContent(name: model.name, lastName: model.lastName, phone: model.phone, email: model.email, image: model.avatar)
    }

    private func fetchUserData() {
        service?.fetchUserData({ [weak self] user in
            guard let self = self else { return }
            self.model = user
        })
    }
}
