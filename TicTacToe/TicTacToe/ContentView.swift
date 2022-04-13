//
//  ContentView.swift
//  TicTacToe
//
//  Created by Paweł Brzozowski on 13/04/2022.
//

import SwiftUI

struct ContentView: View {
    let colums: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State private var moves: [Move?] = Array(repeating: nil, count: 9)
//    @State private var isHumanTurn = true
    @State private var isGameBoardDisabled = false
    @State private var alertItem: AlertItem?
    
    var body: some View {
        GeometryReader {geometry in
            VStack{
                Spacer()
                LazyVGrid(columns: colums,spacing: 10) {
                    ForEach(0..<9) { index in
                        ZStack {
                            Circle()
                                .foregroundColor(.red)
                                .opacity(0.5)
                                .frame(width: geometry.size.width/3 - 15, height: geometry.size.width/3 - 15)
                            Image(systemName: moves[index]?.indicator ?? "")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                        }.onTapGesture {
                            if isSquareOccupied(in: moves, forIndex: index) {return}
                            moves[index] = Move(player: .human, boardIndex: index)
                            isGameBoardDisabled = true
                            
                            if checkWinCondition(for: .human, in: moves) {
                                alertItem = AlertContext.humanWin
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
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
                    }
                }
                Spacer()
            }
            .disabled(isGameBoardDisabled)
            .padding()
            .alert(item: $alertItem) { alertItem in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: .default(alertItem.buttonTitle, action: {
                    resetGame()
                }))
            }
        }
    }
    
    func resetGame() {
    moves = Array(repeating: nil, count: 9)
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
        var movePosition = Int.random(in: 0..<9)
        while isSquareOccupied(in: moves, forIndex: movePosition) {
            movePosition = Int.random(in: 0..<9)
        }
        return movePosition
    }
}

enum Player {
    case human
    case computer
}

struct Move {
    let player: Player
    let boardIndex: Int
    var indicator: String {
        return player == .human ? "xmark" : "circle"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
