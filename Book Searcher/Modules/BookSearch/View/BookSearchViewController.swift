//
//  BookSearchViewController.swift
//  Book Search
//
//  Created by Oybek on 8/2/21.
//

import UIKit

class BookSearchViewController: UIViewController, BookSearchViewProtocol {
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    // MARK: - Properties
    var presenter: BookSearchPresenterProtocol?
    
    var books: [Book] = []

    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.backgroundColor = .white
        searchBar.placeholder = "Search..."
        searchBar.delegate = self
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    // MARK: - Protocol stubs
    func update(with books: [Book]) {
        DispatchQueue.main.async {
            self.books = books
            self.tableView.reloadData()
        }
    }
    func update(with error: String) {
        // todo: handle error
    }
    // MARK: - Functions
    private func configureUI() {
        view.backgroundColor = .white
        // searchBar constraints
        searchBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        view.addSubview(searchBar)
        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        // tableView constraints
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
}
// MARK: - UITableViewDataSource/Delegate
extension BookSearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
}
// MARK: - UISearchBarDelegate
extension BookSearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        //gotta set presenter's variable
    }
}
// MARK: - Protocol
protocol BookSearchViewProtocol {
    var presenter: BookSearchPresenterProtocol? {get set}
    func update(with books: [Book])
    func update(with error: String)
}