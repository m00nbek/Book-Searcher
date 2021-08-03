//
//  BookDetailPresenter.swift
//  Book Searcher
//
//  Created by Oybek on 8/2/21.
//

import Foundation

class BookDetailPresenter: BookDetailPresenterProtocol {
    var router: BookDetailRouterProtocol?
    var interactor: BookDetailInteractorProtocol?
    var view: BookDetailViewProtocol?
    var book: Book? {
        didSet {
            // todo - avoid force unwrapping
            view?.update(with: book!)
        }
    }
}
// MARK: - Protocol
protocol BookDetailPresenterProtocol {
    var router: BookDetailRouterProtocol? {get set}
    var interactor: BookDetailInteractorProtocol? {get set}
    var view: BookDetailViewProtocol? {get set}
    var book: Book? {get set}
}
