//
//  CollectionViewController.swift
//  MyFirstMVP
//
//  Created by Artem Shilov on 09.06.2022.
//

import UIKit

final class CollectionMenuViewController: UIViewController {

    //MARK: - Properties
    private var presenter: CollectionMenuPresenterProtocol
    
    private lazy var сollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 1
        layout.itemSize = CGSize(width: view.frame.size.width/2.1, height: view.frame.size.height/5)
    
        let сollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        сollectionView.register(CollectionViewCustomCell.self, forCellWithReuseIdentifier: "CollectionViewCustomCell")
        return сollectionView
    }()
    
    //MARK: - Init
    init(presenter: CollectionMenuPresenterProtocol) {
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
        view.backgroundColor = .systemGray4
        self.navigationItem.title = "CollectionView"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
}

//MARK: - Extensions
extension CollectionMenuViewController: CollectionMenuViewProtocol {
    
    func configureCollectionView() {
        view.addSubview(сollectionView)
        сollectionView.delegate = self
        сollectionView.dataSource = self
        сollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func reloadCollectionView() {
        сollectionView.reloadData()
    }
}

extension CollectionMenuViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.numberOfRowsInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        presenter.cellForItemAt(collectionView, cellForItemAt: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let navigationController = self.navigationController else { return }
        presenter.didSelectItemAt(indexPath: indexPath, navigationController)
    }
}
