//
//  Card.swift
//  Quotes
//
//  Created by Paweł Brzozowski on 01/02/2022.
//

import SwiftUI

struct Card: View {
    
    var quote: Quote
    
    var body: some View {
        ZStack {
            // Backgroudn img
            Image(quote.image).resizable()
                .aspectRatio(contentMode: .fill)
                .cornerRadius(15)
            
            // Text Stack
            VStack(alignment: .leading, spacing:  10) {
                if quote.quotes.count > 0 {
                    Text(quote.quotes[0]).font(.largeTitle).fontWeight(.bold)
                }
                
                // Name
                Text("- " + quote.name)
            }.padding([.top, .leading], 20.0)
                .shadow(color: .black, radius: 10, x: 2, y: 2)
        }.foregroundColor(Color.white)
            .frame(width: .none, height: 400, alignment: .center)
            .clipped()
            .cornerRadius(15)
            .padding([.leading, .trailing])
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(quote: DataService().quotes[0])
    }
}
