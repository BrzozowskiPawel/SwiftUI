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
        // Pasred the loacl json file
        
        // Set the Recipes property
    }
}
