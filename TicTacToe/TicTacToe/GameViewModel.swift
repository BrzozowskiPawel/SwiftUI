//
//  GameViewModel.swift
//  TicTacToe
//
//  Created by Paweł Brzozowski on 13/04/2022.
//

import Foundation
import SwiftUI

final class GameViewModel: ObservableObject {
    let colums: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @Published var moves: [Move?] = Array(repeating: nil, count: 9)
    @Published var isGameBoardDisabled = false
    @Published var alertItem: AlertItem?
    
    func processPlayerMove(for index: Int) {
        if isSquareOccupied(in: moves, forIndex: index) {return}
        moves[index] = Move(player: .human, boardIndex: index)
        isGameBoardDisabled = true
        
        if checkWinCondition(for: .human, in: moves) {
            alertItem = AlertContext.humanWin
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) { [self] in
            let computerPosition = determineComputerMovesPosition(in: moves)
            moves[computerPosition] = Move(player: .computer, boardIndex: computerPosition)
            isGameBoardDisabled = false
            
            if checkWinCondition(for: .computer, in: moves) {
                alertItem = AlertContext.computerWin
            }
        }
        
        if checkForDraw(in: moves) {
            alertItem = AlertContext.draw
        }
    }
    
    func resetGame() {
        moves = Array(repeating: nil, count: 9)
        isGameBoardDisabled = false
    }
    
    func checkForDraw(in moves: [Move?]) -> Bool {
        return moves.compactMap({$0}).count == 9
    }
    
    func checkWinCondition(for player: Player, in moves: [Move?]) -> Bool {
        let winPatterns: Set<Set<Int>> = [[0,1,2],[3,4,5],[6,7,8],[0,3,6], [1,4,7], [2,5,8],[0,4,8],[2,4,6]]
        let playerMoves = moves.compactMap({$0}).filter({$0.player == player})
        let playerPosition = Set(playerMoves.map({$0.boardIndex}))
        
        for pattern in winPatterns where pattern.isSubset(of: playerPosition) {return true}
        return false
    }
    
    func isSquareOccupied(in moves: [Move?], forIndex index: Int) -> Bool {
        return moves.contains(where: {$0?.boardIndex == index})
    }
    
    func determineComputerMovesPosition(in moves: [Move?]) -> Int {
        
        // If AI can win, win
        let winPatterns: Set<Set<Int>> = [[0,1,2],[3,4,5],[6,7,8],[0,3,6], [1,4,7], [2,5,8],[0,4,8],[2,4,6]]
        let computerMoves = moves.compactMap({$0}).filter({$0.player == .computer})
        let computerPosition = Set(computerMoves.map({$0.boardIndex}))
        for pattern in winPatterns {
            let winPositions = pattern.subtracting(computerPosition)
            if winPositions.count == 1 {
                let isAvalible = !isSquareOccupied(in: moves, forIndex: winPositions.first!)
                if isAvalible {return winPositions.first!}
            }
        }
        
        // If AI can't win, try to block
        let humanMoves = moves.compactMap({$0}).filter({$0.player == .human})
        let humanPosition = Set(humanMoves.map({$0.boardIndex}))
        for pattern in winPatterns {
            let winPositions = pattern.subtracting(humanPosition)
            if winPositions.count == 1 {
                let isAvalible = !isSquareOccupied(in: moves, forIndex: winPositions.first!)
                if isAvalible {return winPositions.first!}
            }
        }
        
        // If AI can't win or blokc, take a middle square
        let centerSquareIndex = 4
        if !isSquareOccupied(in: moves, forIndex: 4) {return centerSquareIndex}
        
        
        // IF AI cant take the middle square, taka a random one
        var movePosition = Int.random(in: 0..<9)
        while isSquareOccupied(in: moves, forIndex: movePosition) {
            movePosition = Int.random(in: 0..<9)
        }
        return movePosition
    }
}
