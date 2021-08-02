//
//  BookSearchInteractor.swift
//  Book Searcher
//
//  Created by Oybek on 8/2/21.
//

import Foundation

class BookSearchInteractor: BookSearchInteractorProtocol {
    var presenter: BookSearchPresenter?
    func getBooks() {
        
    }
}

protocol BookSearchInteractorProtocol {
    var presenter: BookSearchPresenter? {get set}
    func getBooks()
}
