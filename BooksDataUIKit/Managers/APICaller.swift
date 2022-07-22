//
//  APICaller.swift
//  BooksDataUIKit
//
//  Created by Sebastian Hajduk on 14/07/2022.
//

import Foundation

struct BookList: Codable {
    let bookList: [Book]
}

class APICaller {
    static let shared = APICaller()
    
    let books: [Book] = Bundle.main.decode("books.json")
}

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else { fatalError("Failed to locate \(file) in bundle.") }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let loaded = try decoder.decode(T.self, from: data)
            return loaded
        } catch {
            print(error)
            return [] as! T
        }
    }
}
