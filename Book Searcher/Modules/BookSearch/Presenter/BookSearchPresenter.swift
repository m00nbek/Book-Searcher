//
//  Presenter.swift
//  Book Searcher
//
//  Created by Oybek on 8/2/21.
//

import Foundation

enum FetchError: Error {
    case failed
}

class BookSearchPresenter: BookSearchPresenterProtocol {
    var router: BookSearchRouterProtocol?
    var interactor: BookSearchInteractorProtocol?
    var view: BookSearchViewProtocol?
    var searchText: String? {
        didSet {
            interactor?.getBooks(for: searchText!)
        }
    }
    func interactorDidFetchBooks(with result: Result<[Book], Error>) {
        switch result {
        case .success(let books):
            view?.update(with: books)
        case .failure:
            view?.update(with: "Something went wrong")
        }
    }
}

protocol BookSearchPresenterProtocol {
    var router: BookSearchRouterProtocol? {get set}
    var interactor: BookSearchInteractorProtocol? {get set}
    var view: BookSearchViewProtocol? {get set}
    var searchText: String? {get set}
    
    func interactorDidFetchBooks(with result: Result<[Book], Error>)
}

