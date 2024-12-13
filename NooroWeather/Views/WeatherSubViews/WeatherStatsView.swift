//
//  WeatherStatsView.swift
//  NooroWeather
//
//  Created by Matthew Johnson on 12/13/24.
//


import SwiftUI

struct WeatherStatsView: View {
    let weather: CurrentWeather
    
    var body: some View {
        HStack {
            // Humidity
            VStack {
                Text("Humidity")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text("\(weather.humidity)%")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
            }
            Spacer()
            
            // UV Index
            VStack {
                Text("UV")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text("\(Int(weather.uv))")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
            }
            Spacer()
            
            // Feels Like
            VStack {
                Text("Feels Like")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text("\(Int(weather.feelslike_f))°")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(15)
    }
}

#Preview {
    WeatherStatsView(weather: sampleCurrentWeather)
}
