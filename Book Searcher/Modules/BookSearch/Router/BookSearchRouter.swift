//
//  BookSearchRouter.swift
//  Book Searcher
//
//  Created by Oybek on 8/2/21.
//

import UIKit

class BookSearchRouter: BookSearchRouterProtocol {
    
    var entry: EntryPoint?
    static func start() -> BookSearchRouterProtocol {
        let router = BookSearchRouter()
        var view: BookSearchViewProtocol = BookSearchViewController()
        var presenter: BookSearchPresenterProtocol = BookSearchPresenter()
        var interactor: BookSearchInteractorProtocol = BookSearchInteractor()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router
        
        router.entry = view as? EntryPoint
        
        return router
    }
    func pushToBookDetailScreen(with book: Book, navigationController: UINavigationController) {
        let bookDetailScreen = BookDetailRouter.createBookDetail(with: book)
        navigationController.pushViewController(bookDetailScreen, animated: true)
    }
}
// MARK: - Protocol
typealias EntryPoint = BookSearchViewProtocol & UIViewController
protocol BookSearchRouterProtocol {
    var entry: EntryPoint? {get}
    static func start() -> BookSearchRouterProtocol
    func pushToBookDetailScreen(with book: Book, navigationController: UINavigationController)
}

