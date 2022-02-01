//
//  DataService.swift
//  Quotes
//
//  Created by Paweł Brzozowski on 01/02/2022.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Quote] {
        
        // Get a url to the JSON file
        let pathString = Bundle.main.path(forResource: "Data", ofType: "json")
        
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
            
            let decodedData = try decoder.decode([Quote].self, from: data)
            
            // Add UUID
            for item in decodedData {
                item.id = UUID()
            }
            
            // Return the recipes
            return decodedData
            
        } catch {
            // Error with getting data
            print(error)
        }
        
        return [Quote]()
    }
}

