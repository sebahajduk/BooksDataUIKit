//
//  HomeController.swift
//  BooksDataUIKit
//
//  Created by Sebastian Hajduk on 12/07/2022.
//

import Foundation
import UIKit

class HomeController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var tableView = UITableView()
    var sectionHeaders: [String] = ["NEW BOOKS", "AUDIOBOOKS"]
    
    
    private var allBooks: [Book] = []
    
    private let mainTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = backgroundPink
        tableView.contentInset.top = 20
        tableView.register(NewBooksCollectionViewUITableViewCell.self, forCellReuseIdentifier: NewBooksCollectionViewUITableViewCell.identifier)
        tableView.register(AudiobooksCollectionViewUITableViewCell.self, forCellReuseIdentifier: AudiobooksCollectionViewUITableViewCell.identifier)
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.frame = view.bounds.insetBy(dx: 20, dy: 0)
        view.addSubview(mainTableView)
        
        let headerView = LogoHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 150))
        mainTableView.tableHeaderView = headerView
        
        getBooks()
    }
    
    private func getBooks() {
       allBooks = APICaller.shared.books
    }
    
}

extension HomeController {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionHeaders.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         switch indexPath.section {
        case 0:
             guard let cell = tableView.dequeueReusableCell(withIdentifier: NewBooksCollectionViewUITableViewCell.identifier, for: indexPath) as? NewBooksCollectionViewUITableViewCell else {
                 return UITableViewCell()
             }
             return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AudiobooksCollectionViewUITableViewCell.identifier, for: indexPath) as? AudiobooksCollectionViewUITableViewCell else {
                return UITableViewCell()
            }
             print(allBooks[indexPath.item].imageLink)
             return cell
        }
        
         
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
        case 0:
            return 240
        case 1:
            return 330
        default:
            print("default")
            return 330
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionHeaders[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        header.textLabel?.textColor = mainGreen
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x, y: header.bounds.origin.y + 10, width: header.bounds.width, height: header.bounds.height)
        header.textLabel?.textAlignment = NSTextAlignment.center
    }
}
 
