//
//  ContentView.swift
//  ARapp
//
//  Created by Paweł Brzozowski on 13/04/2022.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    var body: some View {
        return Text("Hello World ❤️")
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
