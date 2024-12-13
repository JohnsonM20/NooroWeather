//
//  CitySearchViewModel.swift
//  NooroWeather
//
//  Created by Matthew Johnson on 12/13/24.
//


import Combine
import SwiftUI

class CitySearchViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var suggestions: [Location] = []
    @Published var selectedCity: Location?
    
    private var cancellables = Set<AnyCancellable>()
    private let apiService = WeatherAPIService()

    init() {
        setupSearchListener()
        loadSelectedCity()
    }

    /// Sets up a Combine listener to observe searchText changes and fetch city suggestions
    private func setupSearchListener() {
        $searchText
            .debounce(for: .milliseconds(300), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink { [weak self] text in
                guard let self = self else { return }
                if text.isEmpty {
                    self.suggestions = []
                } else {
                    self.fetchCities(query: text)
                }
            }
            .store(in: &cancellables)
    }

    /// Fetches city suggestions from the API based on the query text
    private func fetchCities(query: String) {
        apiService.fetchCities(query: query) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let locations):
                    self?.suggestions = locations
                case .failure(let error):
                    print("Error fetching cities: \(error.localizedDescription)")
                }
            }
        }
    }
    
    // Handles the selection of a city by clearing the search text and persisting the selected city
    func selectCity(_ location: Location) {
        self.searchText = ""
        self.selectedCity = location
        persistSelectedCity(location)
    }

    // Persists the selected city to UserDefaults as encoded data
    private func persistSelectedCity(_ location: Location) {
        do {
            let encodedData = try JSONEncoder().encode(location)
            UserDefaults.standard.set(encodedData, forKey: AppStorageKeys.selectedCity)
        } catch {
            print("Failed to encode and save city: \(error)")
        }
    }

    // Loads the previously selected city from UserDefaults if it exists
    private func loadSelectedCity() {
        guard let data = UserDefaults.standard.data(forKey: AppStorageKeys.selectedCity) else { return }
        if let city = try? JSONDecoder().decode(Location.self, from: data) {
            self.selectedCity = city
        }
    }
}
