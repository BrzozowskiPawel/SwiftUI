//
//  DetailView.swift
//  Quotes
//
//  Created by Paweł Brzozowski on 01/02/2022.
//

import SwiftUI

struct DetailView: View {
    
    var quote: Quote?
    
    var body: some View {
        
        if let quote = quote {
            VStack(alignment: .leading, spacing: 20) {
                // Author
                Text(quote.name).font(.largeTitle).fontWeight(.bold)
                
                // Quotes
                ForEach(quote.quotes, id:\.self) { quote in
                    Text(quote)
                }
                
                Spacer()
            }.padding()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(quote: DataService().quotes[0])
    }
}
