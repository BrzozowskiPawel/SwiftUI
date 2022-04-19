//
//  ContentView.swift
//  Drag
//
//  Created by Paweł Brzozowski on 19/04/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LinearGradient(colors: [.yellow,.red], startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 200, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
