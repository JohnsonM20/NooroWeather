//
//  WeatherViewModel.swift
//  NooroWeather
//
//  Created by Matthew Johnson on 12/13/24.
//


import SwiftUI
import Combine

class WeatherViewModel: ObservableObject {
    @Published var weather: CurrentWeather?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    let location: Location
    private let apiService = WeatherAPIService()
    
    init(location: Location) {
        self.location = location
        fetchWeather()
    }

    /// Fetch weather data for the assigned location.
    private func fetchWeather() {
        self.isLoading = true
        self.errorMessage = nil
        self.weather = nil

        apiService.fetchCurrentWeather(for: location) { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                self.isLoading = false

                switch result {
                case .success(let weatherResponse):
                    self.weather = weatherResponse.current
                case .failure(let error):
                    self.errorMessage = "Failed to fetch weather: \(error.localizedDescription)"
                }
            }
        }
    }
}
