//
//  Expenses.swift
//  iExpense
//
//  Created by Paweł Brzozowski on 20/04/2022.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
