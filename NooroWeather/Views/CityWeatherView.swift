//
//  CityWeatherView.swift
//  NooroWeather
//
//  Created by Matthew Johnson on 12/13/24.
//

import SwiftUI

struct CityWeatherView: View {
    @StateObject var viewModel: WeatherViewModel
    
    init(location: Location) {
        _viewModel = StateObject(wrappedValue: WeatherViewModel(location: location))
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 0.0) {
            if viewModel.isLoading {
                ProgressView("Loading...")
                
            } else if let error = viewModel.errorMessage {
                Text(error)
                
            } else if let weather = viewModel.weather {
                WeatherIconView(iconURL: weather.condition.icon, size: 150)
                
                HStack {
                    Text(viewModel.location.name)
                        .font(.title)
                        .bold()
                    
                    Image(systemName: "location.fill")
                }
                
                TemperatureView(temperature: weather.temp_f, fontSize: 55)
                
                WeatherStatsView(weather: weather)
                    .padding(.vertical, 30)
                    .padding(.horizontal, 50)
                
            } else {
                Text("No weather data available.")
            }
        }
    }
}

#Preview {
    CityWeatherView(location: sampleLocation)
}
