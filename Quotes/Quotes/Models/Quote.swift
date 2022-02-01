//
//  Quote.swift
//  Quotes
//
//  Created by Paweł Brzozowski on 01/02/2022.
//

import Foundation

class Quote: Identifiable, Decodable{
    var id: UUID?
    var name: String
    var quotes: [String]
    var image: String
}
