//
//  DetailViewController.swift
//  MyFirstMVP
//
//  Created by Artem Shilov on 09.06.2022.
//

import UIKit

class DetailViewController: UIViewController {

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
        
        view.addSubview(photoImageView)
        photoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(150)
            make.width.equalToSuperview()
            make.height.equalTo(400)
        }
    
        view.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(photoImageView.snp.bottom).inset(20)
            make.width.equalToSuperview()
        }
    }
}

//MARK: - Extensions
extension DetailViewController: DetailViewProtocol {
    
    func setContent(title: String, description: String, image: UIImage) {
        self.navigationItem.title = title
        descriptionLabel.text = description
        photoImageView.image = image
    }
}
