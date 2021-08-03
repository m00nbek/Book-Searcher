//
//  BookDetailRouter.swift
//  Book Searcher
//
//  Created by Oybek on 8/2/21.
//

import UIKit

class BookDetailRouter: BookDetailRouterProtocol {
    static func createBookDetail(with book: Book) -> BookDetailViewController {
        let router = BookDetailRouter()
        let view = BookDetailViewController()
        var presenter: BookDetailPresenterProtocol = BookDetailPresenter()
        var interactor: BookDetailInteractorProtocol = BookDetailInteractor()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router
                
        presenter.book = book
        return view
    }
}
// MARK: - Protocol
protocol BookDetailRouterProtocol {
    static func createBookDetail(with book: Book) -> BookDetailViewController
}
