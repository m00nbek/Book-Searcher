//
//  Presenter.swift
//  Book Searcher
//
//  Created by Oybek on 8/2/21.
//

import Foundation

class BookSearchPresenter: BookSearchPresenterProtocol {
    var router: BookSearchRouterProtocol?
    var interactor: BookSearchInteractorProtocol?
    var view: BookSearchViewProtocol?
    func interactorDidFetchBooks(with result: Result<[Book], Error>) {
        
    }
}

protocol BookSearchPresenterProtocol {
    var router: BookSearchRouterProtocol? {get set}
    var interactor: BookSearchInteractorProtocol? {get set}
    var view: BookSearchViewProtocol? {get set}
    
    func interactorDidFetchBooks(with result: Result<[Book], Error>)
}

