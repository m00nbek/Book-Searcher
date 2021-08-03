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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
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
        // todo - handle error
        print(error)
    }
    // MARK: - Functions
    private func configureUI() {
        view.backgroundColor = .white
        // register BookCell
        tableView.register(BookCell.self, forCellReuseIdentifier: Constants.bookCellIdentifier)
        // searchBar constraints
        view.addSubview(searchBar)
        NSLayoutConstraint.activate([
            searchBar.heightAnchor.constraint(equalToConstant: 50),
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            searchBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        // tableView constraints
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
// MARK: - UITableViewDataSource/Delegate
extension BookSearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.bookCellIdentifier, for: indexPath) as? BookCell
        cell?.book = books[indexPath.row]
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.showBookDetailScreen(with: books[indexPath.row], navigationController: navigationController!)
    }
}
// MARK: - UISearchBarDelegate
extension BookSearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        // checking if searchText is not empty and doesn't contain space
        if let searchText = searchBar.text {
            if searchText != " " {
                // setting presenter's variable
                presenter?.searchText = searchText
            }
        }
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // checking if searchText is not empty and doesn't contain space
        if !searchText.isEmpty && searchText != " " {
            // setting presenter's variable
            presenter?.searchText = searchText
        }
    }
}
// MARK: - Protocol
protocol BookSearchViewProtocol {
    var presenter: BookSearchPresenterProtocol? {get set}
    func update(with books: [Book])
    func update(with error: String)
}
