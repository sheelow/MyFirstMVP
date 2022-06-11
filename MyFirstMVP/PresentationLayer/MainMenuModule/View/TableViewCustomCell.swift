//
//  TableViewCustomCellTableViewCell.swift
//  MyFirstMVP
//
//  Created by Artem Shilov on 09.06.2022.
//

import UIKit
import SnapKit

class TableViewCustomCell: UITableViewCell {
    
    //MARK: - Properties
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textAlignment = .left
        nameLabel.numberOfLines = 0
        nameLabel.font = .systemFont(ofSize: 18)
        nameLabel.textColor = .black
        return nameLabel
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.textAlignment = .left
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = .systemFont(ofSize: 14)
        descriptionLabel.textColor = .black
        return descriptionLabel
    }()
    
    private lazy var photoImageView: UIImageView = {
        let photoImageView = UIImageView()
        photoImageView.contentMode = .scaleAspectFit
        return photoImageView
    }()
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    func setContent(name: String, description: String, image: UIImage) {
        nameLabel.text = name
        descriptionLabel.text = description
        photoImageView.image = image
    }
    
    private func configureCell() {
        configurePhotoImage()
        configureNameLabel()
        configureDescriptionLabel()
    }
    
    private func configurePhotoImage() {
        addSubview(photoImageView)
        photoImageView.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(10)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
    }
    
    private func configureNameLabel() {
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(photoImageView.snp.right).offset(10)
            make.top.equalToSuperview().inset(10)
            make.right.equalToSuperview().inset(10)
        }
    }
    
    private func configureDescriptionLabel() {
        addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.left.equalTo(photoImageView.snp.right).offset(10)
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.right.equalToSuperview().inset(10)
        }
    }
}
