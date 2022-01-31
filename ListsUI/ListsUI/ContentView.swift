//
//  ContentView.swift
//  ListsUI
//
//  Created by Paweł Brzozowski on 31/01/2022.
//

import SwiftUI

struct ContentView: View {
    
    var array = ["Element 1","Element 2","Element 3","Element 4","Element 5","Element 6"]
    
    var body: some View {
        
        NavigationView {
            
            List(array, id: \.self) { arrayElement in
                
                NavigationLink {
                    Text("Destination")
                } label: {
                    Text(arrayElement)
                }
                
            }.navigationTitle(Text("My List")).listStyle(PlainListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
