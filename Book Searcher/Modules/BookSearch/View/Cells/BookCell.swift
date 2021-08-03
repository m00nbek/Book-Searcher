//
//  BookCell.swift
//  Book Searcher
//
//  Created by Oybek on 8/2/21.
//

import UIKit
import SDWebImage

class BookCell: UITableViewCell {

    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Properties
    var book: Book? {
        didSet {
            DispatchQueue.main.async {
                // update cell data
                self.bookTitle.text = self.book?.title
                if let author = self.book?.authors?[0], let thumbnailLink = self.book?.imageLinks?.thumbnail {
                    self.bookAuthor.text = author
                    let url = URL(string: thumbnailLink)
                    self.thumbnailImageView.sd_setImage(with: url, completed: nil)
                }
            }
        }
    }
    private let thumbnailImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    private let bookTitle: UILabel = {
        let title = UILabel()
        title.font = .systemFont(ofSize: 16)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    private let bookAuthor: UILabel = {
        let author = UILabel()
        author.font = .systemFont(ofSize: 12)
        author.translatesAutoresizingMaskIntoConstraints = false
        return author
    }()
    private lazy var titleStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [bookTitle, bookAuthor])
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    // MARK: - Functions
    private func configureUI() {
        // thumbnailImageView constraints
        addSubview(thumbnailImageView)
        NSLayoutConstraint.activate([
            thumbnailImageView.widthAnchor.constraint(equalToConstant: frame.width / 4),
            thumbnailImageView.topAnchor.constraint(equalTo: topAnchor),
            thumbnailImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            thumbnailImageView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
        // titleStack constrainsts
        addSubview(titleStack)
        NSLayoutConstraint.activate([
            titleStack.topAnchor.constraint(equalTo: topAnchor),
            titleStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleStack.leadingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor),
            titleStack.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
    }
}


