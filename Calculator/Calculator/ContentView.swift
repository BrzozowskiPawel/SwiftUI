//
//  ContentView.swift
//  Calculator
//
//  Created by Paweł Brzozowski on 11/04/2022.
//

import SwiftUI

enum CalcButton: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "x"
    case equal = "="
    case clear = "AC"
    case decimal = "."
    case percent = "%"
    case negative = "-/+"
}

struct ContentView: View {
    
    let buttons: [[CalcButton]] = [
        [.clear, .negative, .percent],
        [.seven, .eight, .nine],
        [.four, .five, .six],
        [.one, .two, .three]
    ]
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                // Text display
                HStack {
                    Spacer()
                    Text("0")
                        .bold()
                        .font(.system(size: 52))
                        .foregroundColor(.white)
                }.padding()
                
                // Buttons
                ForEach(buttons, id: \.self) {row in
                    HStack{
                        ForEach(row, id: \.self) {item in
                            Button {
                                
                            } label: {
                                Text(item.rawValue)
                                    .frame(width: 70, height: 70)
                                    .background(.orange)
                                    .foregroundColor(.white)
                                    .cornerRadius(35)
                                    .font(.system(size: 32))
                            }
                        }
                    }
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
