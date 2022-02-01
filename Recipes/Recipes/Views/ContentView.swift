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
        
        List(model.recipes) {recipe in
            HStack(alignment: .center, spacing: 20.0) {
                Image(recipe.image).resizable().scaledToFit().frame(width: 50, height: 50, alignment: .center).clipped().cornerRadius(5)
                Text(recipe.name)
            }
        }.listStyle(PlainListStyle())
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
