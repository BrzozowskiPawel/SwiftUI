//
//  ContentView.swift
//  Messages+
//
//  Created by Paweł Brzozowski on 24/04/2022.
//

import SwiftUI

struct ContentView: View {
    var messages = [
        Message(id: "1wf", test: "Did you bouth milk? 🐄", recived: true, timestamp: Date()),
        Message(id: "3223", test: "Nooo. I am on my way to the store", recived: false, timestamp: Date()),
        Message(id: "1w2fbsfdf", test: "Awesome. Thank you ❤️", recived: true, timestamp: Date()),
        Message(id: "1cvxfwf", test: "No problem, gonna be back in 15 min 😎", recived: false, timestamp: Date()),
    ]
    
    var body: some View {
        VStack {
            TitleRow()
            ScrollView {
                ForEach(messages) {
                    MessageBubble(message: $0)
                }
            }
            .padding(.top, 10)
            .background(.white)
            .cornerRadius(30, corners: [.topLeft, .topRight])
            
        }
        .background(Color("Peach"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
