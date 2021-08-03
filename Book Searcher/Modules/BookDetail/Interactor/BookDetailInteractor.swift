//
//  BookDetailInteractor.swift
//  Book Searcher
//
//  Created by Oybek on 8/2/21.
//

import Foundation

class BookDetailInteractor: BookDetailInteractorProtocol {
    var presenter: BookDetailPresenterProtocol?
}
// MARK: - Protocol
protocol BookDetailInteractorProtocol {
    var presenter: BookDetailPresenterProtocol? {get set}
}
