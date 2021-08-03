//
//  BookDetailViewController.swift
//  Book Searcher
//
//  Created by Oybek on 8/2/21.
//

import UIKit

class BookDetailViewController: UIViewController, BookDetailViewProtocol {
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    // MARK: - Properties
    var presenter: BookDetailPresenterProtocol?
    
    // MARK: - Protocols stubs
    func update(with book: Book) {
    }
    // MARK: - Functions
    private func configureUI() {
        view.backgroundColor = .white
    }
}
// MARK: - Protocol
protocol BookDetailViewProtocol {
    var presenter: BookDetailPresenterProtocol? {get set}
    func update(with book: Book)
}
