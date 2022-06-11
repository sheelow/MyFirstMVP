//
//  MenuSevice.swift
//  MyFirstMVP
//
//  Created by Artem Shilov on 09.06.2022.
//

import Foundation
import UIKit

final class NetworkService {
    
    func fetchMenuData(_ completion: @escaping ([MenuModel]) -> Void) {
        
        let shashlykImage = UIImage(imageLiteralResourceName: "shashlyk")
        let fishImage = UIImage(imageLiteralResourceName: "fish")
        let pelmeniImage = UIImage(imageLiteralResourceName: "pelmeni")
        let stakeImage = UIImage(imageLiteralResourceName: "stake")
        let chipsImage = UIImage(imageLiteralResourceName: "chips")
        let beerImage = UIImage(imageLiteralResourceName: "beer")
        let vineImage = UIImage(imageLiteralResourceName: "vine")
        let pizzaImage = UIImage(imageLiteralResourceName: "pizza")
        let blinyImage = UIImage(imageLiteralResourceName: "bliny")
        let desertImage = UIImage(imageLiteralResourceName: "desert")
        
        let shashlyk = MenuModel(name: "Шашлындос", description: "Какое-то описание", photo: shashlykImage)
        let fish = MenuModel(name: "Рыбка", description: "Какое-то описание", photo: fishImage)
        let pelmeni = MenuModel(name: "Пельмешатины", description: "Какое-то описание", photo: pelmeniImage)
        let stake = MenuModel(name: "Стэйк", description: "Какое-то описание", photo: stakeImage)
        let chips = MenuModel(name: "Чипсоиды", description: "Какое-то описание", photo: chipsImage)
        let beer = MenuModel(name: "Пивко", description: "Какое-то описание", photo: beerImage)
        let vine = MenuModel(name: "Винишко", description: "Какое-то описание", photo: vineImage)
        let pizza = MenuModel(name: "Пицца", description: "Какое-то описание", photo: pizzaImage)
        let bliny = MenuModel(name: "Блинчики", description: "Какое-то описание", photo: blinyImage)
        let desert = MenuModel(name: "Десертик", description: "Какое-то описание", photo: desertImage)
        
        let result: [MenuModel] = [shashlyk, fish, pelmeni, stake, chips, beer, vine, pizza, bliny, desert]
        
        completion(result)
    }
    
    func fetchUserData(_ completion: @escaping (UserModel) -> Void) {
        let userAvatar = UIImage(imageLiteralResourceName: "avatar")
        
        let firstUser = UserModel(name: "Имя", lastName: "Фамилия", phone: "+7-960-000-0000", email: "userNumberOne@mail.ru", avatar: userAvatar)
        
        let result: UserModel = firstUser
        
        completion(result)
    }
}
