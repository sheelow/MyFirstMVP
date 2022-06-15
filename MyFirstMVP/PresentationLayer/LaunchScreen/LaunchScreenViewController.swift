//
//  LaunchScreenViewController.swift
//  MyFirstMVP
//
//  Created by Artem Shilov on 12.06.2022.
//

import UIKit
import SnapKit

class LaunchScreenViewController: UIViewController {
    
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.lineBreakMode = .byWordWrapping
        nameLabel.numberOfLines = 2
        nameLabel.text = "Онлайн-ресторан 'Помозоль глаза'"
        nameLabel.textColor = .black
        nameLabel.font = UIFont.systemFont(ofSize: 28)
        nameLabel.textAlignment = .center
        return nameLabel
    }()
    
    private lazy var launchImage: UIImageView = {
        let launchImage = UIImageView()
        launchImage.image = UIImage(imageLiteralResourceName: "logo")
        launchImage.contentMode = .scaleAspectFit
        return launchImage
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLaunchScreen()
    }
    
    private func configureLaunchScreen() {
        view.backgroundColor = .white
        
        view.addSubview(launchImage)
        launchImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(400)
            make.height.equalTo(400)
        }
        
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(launchImage.snp.top).offset(20)
            make.width.equalTo(300)
            make.height.equalTo(200)
        }
    }
}
