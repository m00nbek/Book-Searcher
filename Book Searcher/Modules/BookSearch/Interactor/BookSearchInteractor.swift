//
//  BookSearchInteractor.swift
//  Book Searcher
//
//  Created by Oybek on 8/2/21.
//

import Foundation

class BookSearchInteractor: BookSearchInteractorProtocol {
    var presenter: BookSearchPresenterProtocol?
    func getBooks() {
        
    }
}

protocol BookSearchInteractorProtocol {
    var presenter: BookSearchPresenterProtocol? {get set}
    func getBooks()
}
