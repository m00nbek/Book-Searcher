//
//  BookCell.swift
//  Book Searcher
//
//  Created by Oybek on 8/2/21.
//

import UIKit

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
            // update cell data
            bookTitle.text = book?.title
            // todo - get & show all the authors
            if let author = book?.authors?[0] {
                bookAuthor.text = author
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
    // MARK: - Selectors
    // MARK: - API
    // MARK: - Functions
    private func configureUI() {
        thumbnailImageView.widthAnchor.constraint(equalToConstant: frame.width / 4).isActive = true
        addSubview(thumbnailImageView)
        thumbnailImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        thumbnailImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        thumbnailImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        
        addSubview(titleStack)
        titleStack.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleStack.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        titleStack.leadingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor).isActive = true
        titleStack.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
    }
}

