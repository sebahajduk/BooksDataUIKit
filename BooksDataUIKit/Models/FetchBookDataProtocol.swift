//
//  FetchBookDataProtocol.swift
//  BooksDataUIKit
//
//  Created by Sebastian Hajduk on 21/07/2022.
//

import Foundation

protocol FetchBookData {
    func getCover(from: String)
    func getTitle(from: String)
    func getAuthor(from: String)
}
