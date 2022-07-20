//
//  DetailViewController.swift
//  MyFirstMVP
//
//  Created by Artem Shilov on 09.06.2022.
//

import UIKit

final class DetailViewController: UIViewController {

    //MARK: - Properties
    private var presenter: DetailPresenterProtocol
    
    private lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = .systemFont(ofSize: 24)
        descriptionLabel.textColor = .black
        return descriptionLabel
    }()
    
    private lazy var photoImageView: UIImageView = {
        let photoImageView = UIImageView()
        photoImageView.contentMode = .scaleAspectFit
        return photoImageView
    }()
    
    private lazy var orderButton: UIButton = {
        let orderButton = UIButton(type: .system)
        orderButton.setTitle("Заказать", for: .normal)
        orderButton.setTitleColor(.white, for: .normal)
        orderButton.titleLabel?.font = .systemFont(ofSize: 20)
        orderButton.backgroundColor = .red
        orderButton.layer.cornerRadius = 20
        orderButton.addTarget(self, action: #selector(orderButtonTapped), for: .touchUpInside)
        return orderButton
    }()
    
    private lazy var orderLabel: UILabel = {
        let orderLabel = UILabel()
        orderLabel.textAlignment = .center
        orderLabel.font = .systemFont(ofSize: 18)
        orderLabel.textColor = .red
        return orderLabel
    }()

    //MARK: - Init
    init(presenter: DetailPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        presenter.viewDidLoad()
        view.backgroundColor = .white
        self.tabBarController?.tabBar.isHidden = true
        configureView()
    }
    
    //MARK: - Methods
    private func configureView() {
        configurePhotoImage()
        configureDescriptionLabel()
        configureOrderButton()
        configureOrderLabel()
    }
    
    private func configurePhotoImage() {
        view.addSubview(photoImageView)
        photoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(150)
            make.width.equalToSuperview()
            make.height.equalTo(400)
        }
    }
    
    private func configureDescriptionLabel() {
        view.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(photoImageView.snp.bottom).inset(20)
            make.width.equalToSuperview()
        }
    }
    
    private func configureOrderButton() {
        view.addSubview(orderButton)
        orderButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(100)
            make.width.equalTo(300)
            make.height.equalTo(50)
        }
    }
    
    private func configureOrderLabel() {
        view.addSubview(orderLabel)
        orderLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(orderButton.snp.top).offset(-20)
            make.width.equalTo(300)
        }
    }
    
    @objc
    private func orderButtonTapped() {
        guard let title = navigationItem.title else { return }
        orderLabel.text = "\(title) в пути, милорд"
    }
}

//MARK: - DetailViewProtocol
extension DetailViewController: DetailViewProtocol {
    
    func setContent(title: String, description: String, image: UIImage) {
        self.navigationItem.title = title
        descriptionLabel.text = description
        photoImageView.image = image
    }
}
