//
//  ContentView.swift
//  TabView
//
//  Created by Paweł Brzozowski on 14/04/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Text("Screen 1")
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            Text("Screen 2")
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            Text("Screen 3")
                .tabItem {
                    Image(systemName: "cart")
                    Text("Cart")
                }
        }.accentColor(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
