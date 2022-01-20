//
//  ContentView.swift
//  UItest
//
//  Created by Paweł Brzozowski on 20/01/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            Spacer()
            
            Image("logo").resizable().aspectRatio(contentMode: .fit)
            
            Spacer()
            
            HStack {
                Text("Hello")
                Text("Second")
            }
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portrait)
    }
}
