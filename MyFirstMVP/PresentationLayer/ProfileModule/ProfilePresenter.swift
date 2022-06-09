//
//  ProfilePresenter.swift
//  MyFirstMVP
//
//  Created by Artem Shilov on 09.06.2022.
//

import Foundation

//MARK: - Protocols
protocol ProfileViewProtocol: AnyObject {
    
}

protocol ProfilePresenterProtocol: AnyObject {
    var view: ProfileViewProtocol? { get set }
    
}

//MARK: - Presenter
class ProfilePresenter: ProfilePresenterProtocol {
    
    //MARK: - Properties
    weak var view: ProfileViewProtocol?
    
    
}
