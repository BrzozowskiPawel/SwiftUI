//
//  ContentView.swift
//  WeatherApp
//
//  Created by Paweł Brzozowski on 19/04/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var apiManager = APIManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack {
            if let location = locationManager.location {
                if let weather = weather {
                    WeatcherView(weather: weather)
                } else {
                    LoadingView()
                        .task {
                            do {
                                weather = try await apiManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print("ERROR getting weatcher: \(error)")
                            }
                        }
                }
            }
            else {
                if locationManager.isLoading {
                    LoadingView()
                }
                else {
                    WelcomeView().environmentObject(locationManager)
                }
            }
            
        }
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
