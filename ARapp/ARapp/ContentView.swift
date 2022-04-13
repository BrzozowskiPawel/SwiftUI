//
//  ContentView.swift
//  ARapp
//
//  Created by Paweł Brzozowski on 13/04/2022.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    private var models: [String] = {
        let filemanager = FileManager.default
        guard let path = Bundle.main.resourcePath, let files = try? filemanager.contentsOfDirectory(atPath: path) else {
            return []
        }
        var avalibleModels: [String] = []
        for file in files where file.hasSuffix("usdz"){
            let name = file.replacingOccurrences(of: ".usdz", with: "")
            avalibleModels.append(name)
        }
        return avalibleModels
    }()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ARViewContainer()
            ModelPickerView(models: models)
            PlacentButtonsView()
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

struct ModelPickerView: View {
    var models: [String]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 30) {
                ForEach(0..<self.models.count) { index in
                    Button {
                        print("HELLO")
                    } label: {
                        Image(self.models[index])
                            .resizable()
                            .frame(width: 80, height: 80)
                            .aspectRatio(1/1, contentMode: .fit)
                            .background(Color.clear)
                            .cornerRadius(15)
                    }.buttonStyle(.plain)

                }
            }
        }.padding(20)
            .background(Color.black.opacity(0.5))
    }
}

struct PlacentButtonsView: View {
    var body: some View {
        HStack {
        Button {
            print("DEBUG CANCEL")
        } label: {
            Image(systemName: "xmark")
                .frame(width: 60, height: 60)
                .font(.title)
                .foregroundColor(.red)
                .background(Color.white.opacity(0.75))
                .cornerRadius(30)
                .padding(20)
        }
        Button {
            print("DEBUG MODEL CONFIM")
        } label: {
            Image(systemName: "checkmark")
                .frame(width: 60, height: 60)
                .font(.title)
                .foregroundColor(.green)
                .background(Color.white.opacity(0.75))
                .cornerRadius(30)
                .padding(20)
        }
    }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

