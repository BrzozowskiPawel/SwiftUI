//
//  ContentView.swift
//  Quotes
//
//  Created by Paweł Brzozowski on 01/02/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model = DataService()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(model.quotes) { quote in
                        NavigationLink {
                            DetailView(quote: quote)
                        } label: {
                            Card(quote: quote)
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
