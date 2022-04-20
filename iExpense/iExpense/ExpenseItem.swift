//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Paweł Brzozowski on 20/04/2022.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
