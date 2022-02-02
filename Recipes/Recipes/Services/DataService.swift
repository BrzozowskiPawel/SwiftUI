//
//  DataService.swift
//  Recipes
//
//  Created by Paweł Brzozowski on 01/02/2022.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
        
        // Parse local JSON file
        
        // Get a url to the JSON file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        guard pathString != nil else {
            print("There is no data file")
            return []
        }
        
        // Create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        // Create a data object
        do {
            let data = try Data(contentsOf: url)
            
            // Decode the data with JSON decoder
            let decoder = JSONDecoder()
            
            let decodedData = try decoder.decode([Recipe].self, from: data)
            
            // Add UUID
            for item in decodedData {
                item.id = UUID()
                
                for ingriedent in item.ingredients {
                    ingriedent.id = UUID()
                }
            }
            
            // Return the recipes
            return decodedData
            
        } catch {
            // Error with getting data
            print(error)
        }
        
        return [Recipe]()
    }
}
