//
//  Alerts.swift
//  TicTacToe
//
//  Created by Paweł Brzozowski on 13/04/2022.
//

import Foundation
import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    var title: Text
    var message: Text
    var buttonTitle: Text
}

struct AlertContext {
    static let humanWin = AlertItem(title: Text("You win 🏆"), message: Text("Congratulation, you have beaten the AI!"), buttonTitle: Text("Nice!"))
    static let computerWin = AlertItem(title: Text("You lost 😭"), message: Text("This time AI was better."), buttonTitle: Text("Rematch"))
    static let draw = AlertItem(title: Text("It's a draw"), message: Text("There was no winner..."), buttonTitle: Text("Try again"))
}
