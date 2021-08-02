//
//  BookSearchInteractor.swift
//  Book Searcher
//
//  Created by Oybek on 8/2/21.
//

import Foundation

class BookSearchInteractor: BookSearchInteractorProtocol {
    var presenter: BookSearchPresenterProtocol?
    func getBooks(for text: String) {
        guard let url = URL(string: Constants.searchUrl + text) else {
            print("Cannot get url from string")
            return
        }
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                self?.presenter?.interactorDidFetchBooks(with: .failure(FetchError.failed))
                return
            }
            do {
                let decodedData = try JSONDecoder().decode(BookResponse.self, from: data)
                var books = [Book]()
                for bookItem in decodedData.items {
                    books.append(bookItem.volumeInfo)
                }
                self?.presenter?.interactorDidFetchBooks(with: .success(books))
            } catch {
                self?.presenter?.interactorDidFetchBooks(with: .failure(error))
            }
        }.resume()
    }
}

protocol BookSearchInteractorProtocol {
    var presenter: BookSearchPresenterProtocol? {get set}
    func getBooks(for text: String)
}
