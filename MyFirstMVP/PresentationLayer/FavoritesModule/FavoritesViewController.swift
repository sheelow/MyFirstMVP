//
//  FavoritesViewController.swift
//  MyFirstMVP
//
//  Created by Artem Shilov on 12.06.2022.
//

import UIKit
import SnapKit

//MARK: - FavoritesViewController
final class FavoritesViewController: UIViewController {

    //MARK: - Properties
    private lazy var whiteView: UIView = {
        let whiteView = UIView()
        whiteView.backgroundColor = .white
        return whiteView
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    //MARK: - Methods
    private func configureView() {
        view.backgroundColor = .systemGray5
        self.navigationItem.title = "Favorites"
        self.navigationController?.navigationBar.backgroundColor = .white
        configureWhiteView()
    }
    
    private func configureWhiteView() {
        view.addSubview(whiteView)
        whiteView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(90)
        }
    }
}
