//
//  AudiobooksCollectionViewUITableViewCell.swift
//  BooksDataUIKit
//
//  Created by Sebastian Hajduk on 18/07/2022.
//

import UIKit

class AudiobooksCollectionViewUITableViewCell: UITableViewCell {

    static let identifier: String = "AudiobooksCollectionViewUITableViewCell"
    private var books: [Book] = []
    
    private let audiobooksCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 180, height: 90)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(AudiobookCollectionViewCell.self, forCellWithReuseIdentifier: AudiobookCollectionViewCell.identifier)
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure(with: APICaller.shared.books)
        
        audiobooksCollectionView.backgroundColor = backgroundPink
        contentView.addSubview(audiobooksCollectionView)
        
        audiobooksCollectionView.delegate = self
        audiobooksCollectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        audiobooksCollectionView.frame = contentView.bounds
    }
    
    private func configure(with books: [Book]) {
        self.books = APICaller.shared.books
    }
    
}

extension AudiobooksCollectionViewUITableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AudiobookCollectionViewCell.identifier, for: indexPath) as? AudiobookCollectionViewCell else { return UICollectionViewCell() }
        
        cell.getAuthor(from: books[indexPath.row].author)
        cell.getCover(from: books[indexPath.row].imageLink)
        cell.getTitle(from: books[indexPath.row].title)
        
        return cell
        
    }
}
