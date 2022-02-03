//
//  RecipeFeaturedView.swift
//  Recipes
//
//  Created by Paweł Brzozowski on 02/02/2022.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model: RecipeModel
    @State var isDetailViewShowing = false
    @State var tabSelectionIndex = 0
    
    func setFeatureIndex() {
        // Find first recipe that is featured
        var index = model.recipes.firstIndex { recipe -> Bool in
            return recipe.featured
        }
        
        // Set tabSelectionIndex
        self.tabSelectionIndex = index ?? 0
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            Text("Featured Recipes").bold().font(.largeTitle).padding(.leading).padding(.top, 40)
            
            GeometryReader { geo in
                TabView(selection: $tabSelectionIndex) {
                    // Loop through each recipe
                    ForEach(0..<model.recipes.count) { index in
                        if model.recipes[index].featured {
                            
                            // Recipe card button
                            Button {
                                // Show the detail recipe sheet
                                self.isDetailViewShowing = true
                            } label: {
                                // Create a recipe card for futured recipe
                                ZStack {
                                    Rectangle().foregroundColor(.white)
                                    
                                    VStack(spacing: 0) {
                                        Image(model.recipes[index].image).resizable().aspectRatio(contentMode: .fill).clipped()
                                        Text(model.recipes[index].name).padding(.all, 5.0)
                        
                                    }.padding(.bottom)
                                }
                            }.tag(index).sheet(isPresented: $isDetailViewShowing) {
                                // Show the recipe detail view
                                RecipeDetailView(recipe: model.recipes[index])
                            }
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                                .cornerRadius(15)
                                .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)

                            
                        }
                    }
                    
                }.tabViewStyle(.page(indexDisplayMode: .automatic)).indexViewStyle(.page(backgroundDisplayMode: .always))
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Prerp Time:")
                Text(model.recipes[tabSelectionIndex].prepTime)
                Text("Highlight")
                RecipeHighlights(highlightsArray: model.recipes[tabSelectionIndex].highlights)
            }
            .padding(.leading).padding(.bottom)
        }.onAppear {
            setFeatureIndex()
        }
        
        
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView().environmentObject(RecipeModel())
    }
}
