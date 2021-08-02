//
//  BookResponse.swift
//  Book Searcher
//
//  Created by Oybek on 8/2/21.
//

import Foundation

struct BookResponse: Codable {
    let kind: String?
    let totalItems: Int?
    let items: [BookItems]?
}
struct BookItems: Codable {
    let volumeInfo: Book?
}
// MARK: - VolumeInfo
struct Book: Codable {
    let title: String?
    let authors: [String]?
    let description: String?
    let imageLinks: ImageLinks?
}
struct ImageLinks: Codable {
    let smallThumbnail: String?
    let thumbnail: String?
}
