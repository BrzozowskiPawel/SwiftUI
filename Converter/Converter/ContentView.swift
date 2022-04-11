//
//  ContentView.swift
//  Converter
//
//  Created by Paweł Brzozowski on 07/04/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTemperatureInput = ""
    @State private var selectedTemperatureOutput = ""
    @State private var temperatureValue = ""
    var temperatureResult: Double {
        
    }
    
    let temperatureUnits = ["Celcius",  "Fahrenheit", "Kelvin"]
    let lengthUnits = ["meters", "kilometers", "feet", "yards", "miles"]
    let timeUnits = ["seconds", "minutes", "hours", "days"]
    let volumeUnits = ["milliliters", "liters", "cups", "pints", "gallons"]
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Pick your input")
                    Picker("Temperature", selection: $selectedTemperatureInput) {
                        ForEach(temperatureUnits, id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                    Text("Pick your output")
                    Picker("Temperature", selection: $selectedTemperatureOutput) {
                        ForEach(temperatureUnits, id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                    Text("Type value to be converted:")
                    TextField("Value: ", text: $temperatureValue)
                    Text("Type value to be converted:")
                    
                    
                } header: {
                    Text("Temperature 🌡")
                }
                
                Section {
                    Text("HELLO")
                } header: {
                    Text("Length 📏")
                }
                
                Section {
                    Text("HELLO")
                } header: {
                    Text("Time ⏰")
                }
                
                Section {
                    Text("HELLO")
                } header: {
                    Text("Volume 💧")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
