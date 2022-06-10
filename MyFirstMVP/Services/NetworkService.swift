//
//  MenuSevice.swift
//  MyFirstMVP
//
//  Created by Artem Shilov on 09.06.2022.
//

import Foundation
import UIKit

class NetworkService {
    
    func fetchMenuData(_ completion: @escaping ([MenuModel]) -> Void) {
        let shashlykImage = UIImage(imageLiteralResourceName: "shashlyk")
        let fishImage = UIImage(imageLiteralResourceName: "fish")
        let pelmeniImage = UIImage(imageLiteralResourceName: "pelmeni")
        let stakeImage = UIImage(imageLiteralResourceName: "stake")
        let chipsImage = UIImage(imageLiteralResourceName: "chips")
        let beerImage = UIImage(imageLiteralResourceName: "beer")
        let vineImage = UIImage(imageLiteralResourceName: "vine")
        
        let shashlyk = MenuModel(name: "Шашлындос", description: "Какое-то описание", photo: shashlykImage)
        let fish = MenuModel(name: "Рыбка", description: "Какое-то описание", photo: fishImage)
        let pelmeni = MenuModel(name: "Пельмешатины", description: "Какое-то описание", photo: pelmeniImage)
        let stake = MenuModel(name: "Стэйк", description: "Какое-то описание", photo: stakeImage)
        let chips = MenuModel(name: "Чипсоиды", description: "Какое-то описание", photo: chipsImage)
        let beer = MenuModel(name: "Пивко", description: "Какое-то описание", photo: beerImage)
        let vine = MenuModel(name: "Винишко", description: "Какое-то описание", photo: vineImage)
        
        
        let result: [MenuModel] = [shashlyk, fish, pelmeni, stake, chips, beer, vine]
        
        completion(result)
    }
    
    func fetchUserData(_ completion: @escaping (UserModel) -> Void) {
        let userAvatar = UIImage(imageLiteralResourceName: "avatar")
        
        let firstUser = UserModel(name: "Имя", lastName: "Фамилия", phone: "+7-960-000-0000", email: "userNumberOne@mail.ru", avatar: userAvatar)
        
        let result: UserModel = firstUser
        
        completion(result)
    }
}
