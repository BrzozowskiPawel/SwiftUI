//
//  ContentView.swift
//  Project4
//
//  Created by Paweł Brzozowski on 14/04/2022.
//

import SwiftUI
import CoreML

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    static var defaultWakeTime: Date {
        var componetns = DateComponents()
        componetns.hour = 7
        componetns.minute = 0
        return Calendar.current.date(from: componetns) ?? Date.now
    }
    
    var body: some View {
        NavigationView{
            Form{
                VStack(alignment: .leading, spacing: 0) {
                    Text("When do you want to wake up?")
                        .font(.headline)
                    DatePicker("Plase enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                VStack(alignment: .leading, spacing: 0) {
                    Text("How much do you want to sleep?")
                        .font(.headline)
                    Stepper("\(sleepAmount.formatted()) hourd ", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                VStack(alignment: .leading, spacing: 0) {
                    Text("How much coffe do you drink?")
                        .font(.headline)
                    Stepper(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups", value: $coffeeAmount, in: 1...20)
                }
            }
            .navigationTitle("BetterRest")
            .toolbar {
                Button("Calculate") {
                    calculateBedtime()
                }
            }
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("OK") {}
                
            } message: {
                Text(alertMessage)
            }
        }
    }
    func calculateBedtime() {
        do {
            let config = MLModelConfiguration()
            let model = try BetterRest(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hours = (components.hour ?? 0) * 60 * 60
            let minutes = (components.minute ?? 0) * 60
        
            let prediction = try model.prediction(wake: Double(hours + minutes), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            alertTitle = "Your ideal bedtime is"
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        }
        catch {
            alertTitle = "Error"
            alertMessage = "Sorry there was a problem with your caclucations"
            
        }
        
        showingAlert = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
