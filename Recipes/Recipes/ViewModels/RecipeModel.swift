//
//  RecipeModel.swift
//  Recipes
//
//  Created by Paweł Brzozowski on 01/02/2022.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        // Set the Recipes property
        self.recipes = DataService.getLocalData()
    }
}
 
