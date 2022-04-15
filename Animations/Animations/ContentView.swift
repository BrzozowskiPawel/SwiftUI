//
//  ContentView.swift
//  Animations
//
//  Created by Paweł Brzozowski on 15/04/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 0.0
    @State private var xValue = 0.0
    @State private var yValue = 0.0
    @State private var zValue = 0.0
    @State private var duration = 0.0
    
    var body: some View {
        VStack{
            Text("X value: \(xValue)")
            Slider(value: $xValue, in: 0...1)
            Text("Y value: \(yValue)")
            Slider(value: $yValue, in: 0...1)
            Text("Z value: \(zValue)")
            Slider(value: $zValue, in: 0...1)
            Text("Duration: \(duration)")
            Slider(value: $duration, in: 0...4)
            Button("Tap Me") {
                withAnimation(Animation.easeInOut(duration: duration)) {
                    animationAmount += 360
                }
            }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .rotation3DEffect(.degrees(animationAmount), axis: (x: xValue, y: yValue, z: zValue))
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
