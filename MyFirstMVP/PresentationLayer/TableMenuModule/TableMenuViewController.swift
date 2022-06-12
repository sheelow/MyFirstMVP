//
//  MainMenuViewController.swift
//  MyFirstMVP
//
//  Created by Artem Shilov on 09.06.2022.
//

import UIKit

final class TableMenuViewController: UIViewController {
    
    //MARK: - Properties
    private var presenter: TableMenuPresenterProtocol
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TableViewCustomCell.self, forCellReuseIdentifier: "TableViewCustomCell")
        return tableView
    }()
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = "Поиск блюда..."
        searchBar.sizeToFit()
        searchBar.backgroundColor = .white
        return searchBar
    }()
    
    //MARK: - Init
    init(presenter: TableMenuPresenterProtocol) {
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
        searchBar.delegate = self
        view.backgroundColor = .white
        configureNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    private func configureSearchBar() {
        view.addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalToSuperview().inset(100)
            make.left.right.equalToSuperview()
        }
    }
    
    private func configureNavigationBar() {
        self.navigationItem.title = "TableView"
        
        let profileButton = createCustomProfileButton(selector: #selector(profileButtonTapped))
        navigationItem.rightBarButtonItem = profileButton
    }
    
    @objc
    private func profileButtonTapped() {
        let presenter = ProfilePresenter()
        let vc = ProfileViewController(presenter: presenter)
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - TableMenuViewProtocol
extension TableMenuViewController: TableMenuViewProtocol {
    
    func configureTableView() {
        configureSearchBar()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.bottom.left.right.equalToSuperview()
        }
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
}

//MARK: - UITableViewDataSource, UITableViewDelegate
extension TableMenuViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        presenter.cellForRow(tableView, cellForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
        guard let naviGationController = self.navigationController else { return }
        presenter.didSelectRowAt(indexPath: indexPath, naviGationController)
    }
}

//MARK: - UISearchBarDelegate
extension TableMenuViewController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Search = \(searchText)")
    }
}
