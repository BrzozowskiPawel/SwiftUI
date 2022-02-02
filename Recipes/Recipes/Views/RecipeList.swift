//
//  ContentView.swift
//  Recipes
//
//  Created by Paweł Brzozowski on 01/02/2022.
//

import SwiftUI

struct RecipeListView: View {
    
    // Automacially will be populated
    @EnvironmentObject var model: RecipeModel
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading) {
                Text("All Recipes").bold().font(.largeTitle).padding(.top, 40)
                
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        ForEach(model.recipes) {recipe in
                            NavigationLink {
                                RecipeDetailView(recipe: recipe)
                            } label: {
                                HStack(alignment: .center, spacing: 20.0) {
                                    Image(recipe.image).resizable().scaledToFit().frame(width: 50, height: 50, alignment: .center).clipped().cornerRadius(5)
                                    Text(recipe.name).foregroundColor(.black)
                                }
                            }
                            
                        }.listStyle(PlainListStyle()).navigationBarHidden(true)
                    }
                }
            }.padding(.leading)
            
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView().environmentObject(RecipeModel())
    }
}
