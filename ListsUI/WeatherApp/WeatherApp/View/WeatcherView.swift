//
//  WeatcherView.swift
//  WeatherApp
//
//  Created by Paweł Brzozowski on 19/04/2022.
//

import SwiftUI

struct WeatcherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold().font(.title)
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour()))").fontWeight(.light)
                    Spacer()
                    VStack {
                        HStack {
                            VStack(spacing: 20) {
                                Image(systemName: "sun.max").font(.system(size: 40))
                                Text(weather.weather[0].main)
                            }.frame(width: 150, alignment: .leading)
                            
                            Spacer()
                            
                            Text(weather.main.feelsLike.roundDouble2Str() + "°")
                                .font(.system(size: 100))
                                .fontWeight(.bold)
                                .padding()
                        }
                        Spacer()
                            .frame(height: 80)
                        
                        AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 350)
                        } placeholder: {
                            ProgressView()
                        }
                        
                        Spacer()
                        
                        
                    }
                    .frame(maxWidth: .infinity)
                    
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                
            }.padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
}

struct WeatcherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatcherView(weather: previewWeather)
    }
}
