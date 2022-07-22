//
//  BookCollectionViewCell.swift
//  BooksDataUIKit
//
//  Created by Sebastian Hajduk on 18/07/2022.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell, FetchBookData {
    
    static let identifier = "BookCollectionViewCell"
    
    private var books: [Book] = [Book]()
    
    private var coverImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 40
        imageView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMaxYCorner]
        
        return imageView
    }()
    
    private var bookTitle: UILabel = {
        let title = UILabel()
        title.textColor = mainGreen
        title.font = .systemFont(ofSize: 15, weight: .bold)
        return title
    }()
    
    private var bookAuthor: UILabel = {
        let author = UILabel()
        
        author.textColor = mainGreen
        author.layer.opacity = 0.6
        author.font = .systemFont(ofSize: 10, weight: .medium)
        
        return author
    }()
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        let stackView = UIStackView(arrangedSubviews: [coverImageView, bookTitle, bookAuthor])
        addSubview(stackView)
        stackView.frame = self.contentView.bounds
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.spacing = 5
        stackView.alignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    public func getCover(from model: String) {
        coverImageView.image = UIImage(named: model)
    }
    
    public func getTitle(from model: String) {
        bookTitle.text = model
    }
    
    public func getAuthor(from model: String) {
        bookAuthor.text = model
    }
}
