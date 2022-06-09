//
//  CollectionViewController.swift
//  MyFirstMVP
//
//  Created by Artem Shilov on 09.06.2022.
//

import UIKit

class CollectionMenuViewController: UIViewController {

    //MARK: - Properties
    private var presenter: CollectionMenuPresenterProtocol
    
    
    
    init(presenter: CollectionMenuPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
//        presenter.viewDidLoad()
        view.backgroundColor = .systemGray2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
}

//MARK: - Extensions
extension CollectionMenuViewController: CollectionMenuViewProtocol {
    
    func setupTableView() {
//        view.addSubview(tableView)
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
    }
    
    func reloadTableView() {
//        tableView.reloadData()
    }
}
