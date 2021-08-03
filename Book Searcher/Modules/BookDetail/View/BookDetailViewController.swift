//
//  BookDetailViewController.swift
//  Book Searcher
//
//  Created by Oybek on 8/2/21.
//

import UIKit
import SDWebImage

class BookDetailViewController: UIViewController, BookDetailViewProtocol {
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    // MARK: - Properties
    var presenter: BookDetailPresenterProtocol?
    private let thumbnailImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    private let bookTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let bookAuthors: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let bookDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.backgroundColor = .clear
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    private let scrollContentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    // MARK: - Protocols stubs
    func update(with book: Book) {
        DispatchQueue.main.async {
            // todo - avoid force unwrapping
            self.bookTitle.text = book.title!
            
            var authors = ""
            for author in book.authors! {
                authors.append(" \(author)")
            }
            self.bookAuthors.text = authors
            
            self.bookDescription.text = book.description
            if  let thumbnailLink = book.imageLinks?.thumbnail {
                let url = URL(string: thumbnailLink)
                self.thumbnailImageView.sd_setImage(with: url, completed: nil)
            }
        }
    }
    // MARK: - Functions
    private func configureUI() {
        view.backgroundColor = .white
        setupScrollView()
    }
    private func setupScrollView() {
        // adding views
        view.addSubview(scrollView)
        scrollView.addSubview(scrollContentView)
        // constraints
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            scrollContentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollContentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollContentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollContentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollContentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            scrollContentView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor)
        ])
        // thumbnailImageView
        scrollContentView.addSubview(thumbnailImageView)
        NSLayoutConstraint.activate([
            thumbnailImageView.topAnchor.constraint(equalTo: scrollContentView.topAnchor),
            thumbnailImageView.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor),
            thumbnailImageView.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor)
        ])
        // bookTitle
        scrollContentView.addSubview(bookTitle)
        NSLayoutConstraint.activate([
            bookTitle.topAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor),
            bookTitle.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor),
            bookTitle.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor),
        ])
        // bookAuthors
        scrollContentView.addSubview(bookAuthors)
        NSLayoutConstraint.activate([
            bookAuthors.topAnchor.constraint(equalTo: bookTitle.bottomAnchor),
            bookAuthors.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor),
            bookAuthors.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor)
        ])
        // bookDescription
        scrollContentView.addSubview(bookDescription)
        NSLayoutConstraint.activate([
            bookDescription.topAnchor.constraint(equalTo: bookAuthors.bottomAnchor),
            bookDescription.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor),
            bookDescription.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor),
            bookDescription.bottomAnchor.constraint(greaterThanOrEqualTo: scrollContentView.bottomAnchor)
        ])
        
    }
}
// MARK: - Protocol
protocol BookDetailViewProtocol {
    var presenter: BookDetailPresenterProtocol? {get set}
    func update(with book: Book)
}
