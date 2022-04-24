//
//  Message.swift
//  Messages+
//
//  Created by Paweł Brzozowski on 25/04/2022.
//

import Foundation

struct Message: Identifiable, Codable {
    var id: String
    var test: String
    var recived: Bool
    var timestamp: Date
}
