//
//  SearchResponse.swift
//  Stocks
//
//  Created by Gaston Seneza on 9/26/21.
//

import Foundation

struct SearchResponse: Codable {
    let count: Int
    let result: [SearchResult]
}

struct SearchResult: Codable {
    let description: String
    let displaySymbol: String
    let symbol: String
    let type: String
}

