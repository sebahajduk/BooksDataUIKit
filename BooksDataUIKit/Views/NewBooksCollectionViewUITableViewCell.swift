//
//  CollectionViewUITableViewCell.swift
//  BooksDataUIKit
//
//  Created by Sebastian Hajduk on 14/07/2022.
//

import UIKit

class NewBooksCollectionViewUITableViewCell: UITableViewCell {
    
    
    private var books: [Book] = []
    static let identifier = "NewBooksCollectionViewTableViewCell"
    
    private let newBooksCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 125, height: 200)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(BookCollectionViewCell.self, forCellWithReuseIdentifier: BookCollectionViewCell.identifier)
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure(with: APICaller.shared.books)
    
        contentView.backgroundColor = backgroundPink
        contentView.addSubview(newBooksCollectionView)
        
        newBooksCollectionView.delegate = self
        newBooksCollectionView.dataSource = self
        
        newBooksCollectionView.backgroundColor = backgroundPink
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        newBooksCollectionView.frame = contentView.bounds
    }
    
    private func configure(with books: [Book]) {
        self.books = APICaller.shared.books
    }
}

extension NewBooksCollectionViewUITableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookCollectionViewCell.identifier, for: indexPath) as? BookCollectionViewCell else { return UICollectionViewCell() }
        
        cell.getCover(from: books[indexPath.row].imageLink)
        cell.getTitle(from: books[indexPath.row].title)
        cell.getAuthor(from: books[indexPath.row].author)
        
        return cell
    }
}
