//
//  ViewController + CustomBarButtonItem.swift
//  MyFirstMVP
//
//  Created by Artem Shilov on 12.06.2022.
//

import UIKit

extension UIViewController {
    
    func createCustomProfileButton(selector: Selector) -> UIBarButtonItem {
        let customProfileButton = UIButton(type: .system)
        customProfileButton.setImage(UIImage(systemName: "person.fill"), for: .normal)
        customProfileButton.tintColor = .black
        customProfileButton.addTarget(self, action: selector, for: .touchUpInside)
        
        let menuCustomProfileItem = UIBarButtonItem(customView: customProfileButton)
        return menuCustomProfileItem
    }
}
