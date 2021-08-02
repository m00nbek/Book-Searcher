//
//  SearchController.swift
//  Book Searcher
//
//  Created by Oybek on 8/2/21.
//

import UIKit

class BookSearchController: UIViewController, BookSearchViewProtocol {
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - Properties
    var presenter: BookSearchPresenter?
    
    // MARK: - Protocol stubs
    func update(with books: [Book]) {
        
    }
    func update(with error: String) {
        
    }
    // MARK: - Functions
}

protocol BookSearchViewProtocol {
    var presenter: BookSearchPresenter? {get set}
    func update(with books: [Book])
    func update(with error: String)
}
