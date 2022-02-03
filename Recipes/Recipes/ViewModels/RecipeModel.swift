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
    
    static func getPortion(ingredient: Ingredient, recipeServings: Int, targetServings: Int) -> String {
        
        var portion = ""
        var numerator  = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil {
            // Get a single serving size by multpipyling denimnator by the recipe serving
            denominator = denominator * recipeServings
            
            // Get targer portion by multiplaing numerator by target servings
            numerator = numerator * targetServings
            
            // Reduce fraction
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            // Get the whole portion
            if numerator >= denominator {
                // Calcualted the whole porstion
                wholePortions = numerator / denominator
                
                // Calcualte the reminder
                numerator = numerator % denominator
                
                // Assing to portion string
                portion += String(wholePortions)
                
            }
            
            // Express the reminder as a fraction
            if numerator > 0 {
                // assign remainder as fraction to the portion string
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator)/\(denominator)"
            }
        }
            
        if var unit = ingredient.unit {
            // Calculate appropiate suffix
            
            // If we need to plularize
            if wholePortions > 1 {
                if unit.suffix(2) == "ch" {
                    unit += "es"
                }
                else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                }
                else {
                    unit += "s"
                }
            }
            
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            return portion + unit
        }
        
        return portion
    }
}
 
