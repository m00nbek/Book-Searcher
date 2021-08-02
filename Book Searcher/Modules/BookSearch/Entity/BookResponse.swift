//
//  BookResponse.swift
//  Book Searcher
//
//  Created by Oybek on 8/2/21.
//

import Foundation

struct BookResponse: Codable {
    let kind: String
    let totalItems: Int
    let items: [BookItems]
}
struct BookItems: Codable {
    let kind: String
    let id: String
    let etag: String
    let selfLink: String
    
    let volumeInfo: Book
    let saleInfo: SalesInfo
    let accessInfo: AccessInfo
    let searchInfo: SearchInfo
}
// MARK: - VolumeInfo
struct Book: Codable {
    let title: String
    let authors: [String]
    let publisher: String
    let publishedDate: String
    let description: String
    let industryIdentifiers: [IndustryIdentifier]
    let readingModes: ReadingModes
    let pageCount: Int
    let printType: String
    let categories: [String]
    let maturityRating: String
    let allowAnonLogging: Bool
    let contentVersion: String
    let panelizationSummary: PanelizationSummary
    let imageLinks: ImageLinks
    let language: String
    let previewLink: String
    let infoLink: String
    let canonicalVolumeLink: String
}
struct IndustryIdentifier: Codable {
    let type: String
    let identifier: String
}
struct ReadingModes: Codable {
    let text: Bool
    let image: Bool
}
struct PanelizationSummary: Codable {
    let containsEpubBubbles: Bool
    let containsImageBubbles: Bool
}
struct ImageLinks: Codable {
    let smallThumbnail: String
    let thumbnail: String
}
// MARK: - SalesInfo
struct SalesInfo: Codable {
    let country: String
    let saleability: String
    let isEbook: Bool
}
// MARK: - AccessInfo
struct AccessInfo: Codable {
    let country: String
    let viewability: String
    let embeddable: Bool
    let publicDomain: Bool
    let textToSpeechPermission: String
    let epub: Epub
    let pdf: Pdf
    let webReaderLink: String
    let accessViewStatus: String
    let quoteSharingAllowed: Bool
}
struct Epub: Codable {
    let isAvailable: Bool
}
struct Pdf: Codable {
    let isAvailable: Bool
}
// MARK: - SearchInfo
struct SearchInfo: Codable {
    let textSnippet: String
}
