//
//  Router.swift
//  Book Searcher
//
//  Created by Oybek on 8/2/21.
//

import Foundation

class BookSearchRouter: BookSearchRouterProtocol {
    static func start() -> BookSearchRouterProtocol {
        let router = BookSearchRouter()
        return router
    }
}
protocol BookSearchRouterProtocol {
    static func start() -> BookSearchRouterProtocol
}

