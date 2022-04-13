//
//  ContentView.swift
//  TicTacToe
//
//  Created by Paweł Brzozowski on 13/04/2022.
//

import SwiftUI

struct GameView: View {
    @StateObject private var viewModel = GameViewModel()
    
    var body: some View {
        GeometryReader {geometry in
            VStack{
                Spacer()
                LazyVGrid(columns: viewModel.colums, spacing: 10) {
                    ForEach(0..<9) { index in
                        ZStack {
                            GameCircleView(proxy: geometry)
                            PlayerImage(systemImageName:  viewModel.moves[index]?.indicator ?? "")
                        }.onTapGesture {
                            viewModel.processPlayerMove(for: index)
                        }
                    }
                }
                Spacer()
            }
            .disabled(viewModel.isGameBoardDisabled)
            .padding()
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: .default(alertItem.buttonTitle, action: {
                    viewModel.resetGame()
                }))
            }
        }
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
        GameView()
    }
}

struct GameCircleView: View {
    var proxy: GeometryProxy
    var body: some View {
        Circle()
            .foregroundColor(.red)
            .opacity(0.5)
            .frame(width: proxy.size.width/3 - 15, height: proxy.size.width/3 - 15)
    }
}

struct PlayerImage: View {
    var systemImageName: String
    var body: some View {
        Image(systemName: systemImageName)
            .resizable()
            .frame(width: 40, height: 40)
            .foregroundColor(.white)
    }
}
