//
//  MainMenuViewController.swift
//  MyFirstMVP
//
//  Created by Artem Shilov on 09.06.2022.
//

import UIKit

class MainMenuViewController: UIViewController {
    
    //MARK: - Properties
    private var presenter: MainMenuPresenterProtocol
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TableViewCustomCell.self, forCellReuseIdentifier: "TableViewCustomCell")
        return tableView
    }()
    
    init(presenter: MainMenuPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        presenter.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.title = "Выберите блюдо"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
}

//MARK: - Extensions

extension MainMenuViewController: MainMenuViewProtocol {
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
}

extension MainMenuViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRowsInSection()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        presenter.cellForRow(tableView, cellForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let naviGationController = self.navigationController else { return }
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didSelectRowAt(indexPath: indexPath, naviGationController)
    }
}
