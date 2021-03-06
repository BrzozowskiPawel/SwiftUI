//
//  RecipeDetailView.swift
//  Recipes
//
//  Created by Paweł Brzozowski on 01/02/2022.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe: Recipe
    
    @State var selectedServingSize = 2
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading) {
                
                // MARK: Recipe image
                Image(recipe.image).resizable().scaledToFill()
                
                // MARK: Title
                Text(recipe.name).bold().font(.largeTitle).padding(.top, 20).padding(.leading)
                
                // MARK: Portion Picker
                VStack (alignment: .leading){
                    Text("Select your serving size:")
                    Picker("", selection: $selectedServingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }.pickerStyle(.segmented).frame(width: 160)
                }.padding(.leading)
                
                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients").font(.headline).padding(.bottom, 5)
                    
                    ForEach(recipe.ingredients) { item in
                        Text("• " + RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + item.name.lowercased() )
                    }
                }
                .padding(.horizontal)
                // MARK: Divider
                Divider()
                
                // MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions").font(.headline).padding(.vertical, 5.0)
                    ForEach(0..<recipe.directions.count, id:\.self) { index in
                        Text(String(index+1) + ". " + recipe.directions[index])
                    }
                }
                .padding(.horizontal)
            }
        }
        
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        // Create a dummy recipe and pass it into the detail view
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
