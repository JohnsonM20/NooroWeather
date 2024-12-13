//
//  CitySearchCardView.swift
//  NooroWeather
//
//  Created by Matthew Johnson on 12/13/24.
//

import SwiftUI

struct CitySearchCardView: View {
    @StateObject var viewModel: WeatherViewModel
    
    init(location: Location) {
        _viewModel = StateObject(wrappedValue: WeatherViewModel(location: location))
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0.0) {
                Text(viewModel.location.name)
                    .font(.title2)
                    .bold()
                
                if viewModel.isLoading {
                    ProgressView("Loading...")
                    
                } else if let error = viewModel.errorMessage {
                    Text(error)
                    
                } else if let weather = viewModel.weather {
                    TemperatureView(temperature: weather.temp_f, fontSize: 50)
                    
                } else {
                    Text("No weather data available.")
                }
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 0.0) {
                if let weather = viewModel.weather {
                    WeatherIconView(iconURL: weather.condition.icon, size: 100)
                        .padding(-10)
                }
                
                Text("\(viewModel.location.region), \(viewModel.location.country)")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.trailing)
            }

        }
        .foregroundColor(.primary)
    }
}

#Preview {
    CitySearchCardView(location: sampleLocation)
}
