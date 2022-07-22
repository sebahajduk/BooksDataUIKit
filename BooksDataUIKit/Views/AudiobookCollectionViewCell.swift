//
//  AudiobookCollectionViewCell.swift
//  BooksDataUIKit
//
//  Created by Sebastian Hajduk on 21/07/2022.
//

import UIKit

class AudiobookCollectionViewCell: UICollectionViewCell, FetchBookData {
    
    static let identifier: String = "AudiobookCollectionViewCell"
    
    private var bookTitle: UILabel = {
       
        let title = UILabel()
        title.textColor = mainGreen
        title.font = .systemFont(ofSize: 15, weight: .bold)
        title.textAlignment = .left
        
        return title
    }()
    
    private var bookAuthor: UILabel = {
        let author = UILabel()
        
        author.textColor = mainGreen
        author.font = .systemFont(ofSize: 13, weight: .medium)
        author.textAlignment = .left
        
        return author
    }()
    
    private var bookCover: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let titleAndAuthorStackView = UIStackView(arrangedSubviews: [bookTitle, bookAuthor])
        titleAndAuthorStackView.axis = .vertical
        titleAndAuthorStackView.frame = self.contentView.bounds
        titleAndAuthorStackView.alignment = .center
        
        let bookWithCoverStackView = UIStackView(arrangedSubviews: [bookCover, titleAndAuthorStackView])
        bookWithCoverStackView.axis = .horizontal
        bookWithCoverStackView.frame = self.contentView.bounds
        bookWithCoverStackView.distribution = .fill
        bookWithCoverStackView.alignment = .leading
        bookWithCoverStackView.spacing = 5
        addSubview(bookWithCoverStackView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    public func getCover(from model: String) {
        bookCover.image = UIImage(named: model)
    }
    
    public func getTitle(from model: String) {
        bookTitle.text = model
    }
    
    public func getAuthor(from model: String) {
        bookAuthor.text = model
    }
}
