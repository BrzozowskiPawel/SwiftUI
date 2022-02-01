//
//  ContentView.swift
//  Recipes
//
//  Created by Paweł Brzozowski on 01/02/2022.
//

import SwiftUI

struct RecipeListView: View {
    
    // Reference to the view model
    @ObservedObject var model = RecipeModel()
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
