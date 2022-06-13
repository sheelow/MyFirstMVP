//
//  ProfileViewController.swift
//  MyFirstMVP
//
//  Created by Artem Shilov on 09.06.2022.
//

import UIKit
import SnapKit

final class ProfileViewController: UIViewController {
    
    //MARK: - Properties
    private var presenter: ProfilePresenterProtocol
    
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = ""
        nameLabel.textAlignment = .center
        nameLabel.font = .systemFont(ofSize: 20)
        nameLabel.textColor = .black
        return nameLabel
    }()
    
    private lazy var phoneLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "Номер телефона: "
        nameLabel.textAlignment = .left
        nameLabel.font = .systemFont(ofSize: 18)
        nameLabel.textColor = .black
        return nameLabel
    }()
    
    private lazy var emailLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "E-mail: "
        nameLabel.textAlignment = .left
        nameLabel.font = .systemFont(ofSize: 18)
        nameLabel.textColor = .black
        return nameLabel
    }()
    
    private lazy var otherInfoLabel: UILabel = {
        let otherInfoLabel = UILabel()
        otherInfoLabel.text = "И прочая контактная информация..."
        otherInfoLabel.textAlignment = .left
        otherInfoLabel.font = .systemFont(ofSize: 18)
        otherInfoLabel.textColor = .black
        return otherInfoLabel
    }()
    
    private lazy var avatarImage: UIImageView = {
        let avatarImage = UIImageView()
        avatarImage.image = UIImage(imageLiteralResourceName: "ava")
        avatarImage.contentMode = .scaleAspectFit
        avatarImage.layer.cornerRadius = 75
        avatarImage.layer.borderWidth = 3
        avatarImage.layer.borderColor = CGColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        avatarImage.layer.masksToBounds = true
        return avatarImage
    }()
    
    private lazy var whiteView: UIView = {
        let whiteView = UIView()
        whiteView.backgroundColor = .white
        return whiteView
    }()
    
    private var gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        let startColor = UIColor.systemGray3.cgColor
        let endColor = UIColor.white.cgColor
        gradientLayer.colors = [startColor, endColor]
        gradientLayer.locations = [0, 0.8]
        return gradientLayer
    }()
    
    //MARK: - Init
    init(presenter: ProfilePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    override func viewDidLayoutSubviews() {
        gradientLayer.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        presenter.viewDidLoad()
        configureView()
        updateContent()
    }
    
    //MARK: - Methods
    func setContent(name: String, lastName: String, phone: String, email: String, image: UIImage) {
        setTextToContent(name: name, lastName: lastName, phone: phone, email: email, image: image)
    }
    
    private func setTextToContent(name: String, lastName: String, phone: String, email: String, image: UIImage) {
        nameLabel.text = name + " " + lastName
        phoneLabel.text = "Номер телефона: " + phone
        emailLabel.text = "E-mail: " + email
        avatarImage.image = image
    }
    
    private func configureView() {
//        view.backgroundColor = .systemGray5
        view.layer.insertSublayer(gradientLayer, at: 0)
        self.navigationItem.title = "Profile"
        self.navigationController?.navigationBar.backgroundColor = .white
        configureWhiteView()
        configureAvatarImageView()
        configureLabels()
        
    }
    
    private func configureWhiteView() {
        view.addSubview(whiteView)
        whiteView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(90)
        }
    }
    
    private func configureAvatarImageView() {
        view.addSubview(avatarImage)
        avatarImage.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(25)
            make.top.equalTo(whiteView.snp.bottom).offset(25)
            make.width.equalTo(150)
            make.height.equalTo(150)
        }
    }
    
    private func configureLabels() {
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(avatarImage.snp.right).offset(25)
            make.right.equalToSuperview().inset(25)
            make.top.equalTo(whiteView.snp.bottom).offset(25)
        }
        
        view.addSubview(phoneLabel)
        phoneLabel.snp.makeConstraints { make in
            make.top.equalTo(avatarImage.snp.bottom).offset(25)
            make.left.right.equalToSuperview().inset(25)
        }
        
        view.addSubview(emailLabel)
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(phoneLabel.snp.bottom).offset(15)
            make.left.right.equalToSuperview().inset(25)
        }
        
        view.addSubview(otherInfoLabel)
        otherInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(15)
            make.left.right.equalToSuperview().inset(25)
        }
    }
}

//MARK: - Extensions
extension ProfileViewController: ProfileViewProtocol {
    func updateContent() {
        presenter.getData()
    }
}
