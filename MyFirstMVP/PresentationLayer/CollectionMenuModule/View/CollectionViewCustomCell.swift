//
//  CollectionViewCustomCell.swift
//  MyFirstMVP
//
//  Created by Artem Shilov on 09.06.2022.
//

import UIKit
import SnapKit

class CollectionViewCustomCell: UICollectionViewCell {
    
    //MARK: - Properties
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textAlignment = .center
        nameLabel.numberOfLines = 0
        nameLabel.font = .systemFont(ofSize: 18)
        nameLabel.textColor = .black
        return nameLabel
    }()
    
    private lazy var photoImageView: UIImageView = {
        let photoImageView = UIImageView()
        photoImageView.contentMode = .scaleAspectFit
        photoImageView.clipsToBounds = true
        return photoImageView
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    func setContent(name: String, description: String, image: UIImage) {
        nameLabel.text = name
        photoImageView.image = image
    }
    
    private func configureCell() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
        contentView.layer.shadowRadius = 10
        contentView.layer.shadowOpacity = 0.2
        contentView.layer.shadowOffset = CGSize(width: 5, height: 5)
        clipsToBounds = false
        configurePhotoImage()
        configureNameLabel()
    }
    
    private func configurePhotoImage() {
        addSubview(photoImageView)
        photoImageView.snp.makeConstraints { make in
            make.left.top.right.bottom.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
    }
    
    private func configureNameLabel() {
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(photoImageView.snp.bottom).inset(25)
            make.left.right.equalToSuperview().inset(10)
        }
    }
}
