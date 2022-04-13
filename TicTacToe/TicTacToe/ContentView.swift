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
    @State private var isHumanTurn = true
    @State private var isGameBoardDisabled = false
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
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                                let computerPosition = determineComputerMovesPosition(in: moves)
                                moves[computerPosition] = Move(player: .computer, boardIndex: computerPosition)
                                isGameBoardDisabled = false
                            }
                        }
                    }
                }
                Spacer()
            }
            .disabled(isGameBoardDisabled)
            .padding()

        }
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
