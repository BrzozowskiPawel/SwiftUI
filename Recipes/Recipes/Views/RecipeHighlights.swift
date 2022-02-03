//
//  RecipeHighlights.swift
//  Recipes
//
//  Created by Paweł Brzozowski on 03/02/2022.
//

import SwiftUI

struct RecipeHighlights: View {
    
    var highlights = ""
    
    init(highlightsArray:[String]) {
        // Loop through the highlights and build the string
        for index in 0..<highlightsArray.count {
            // it this is the las item don't add the comma
            if index == highlightsArray.count - 1 {
                highlights += highlightsArray[index]
            } else {
                highlights += highlightsArray[index] + ", "
            }
        }
    }
    
    var body: some View {
        Text(highlights)
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highlightsArray: ["test, test2"])
    }
}
