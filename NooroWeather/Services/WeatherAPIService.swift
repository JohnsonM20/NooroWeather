//
//  WeatherAPIService.swift
//  NooroWeather
//
//  Created by Matthew Johnson on 12/13/24.
//


import Foundation

protocol CityFetching {
    func fetchCities(query: String, completion: @escaping (Result<[Location], Error>) -> Void)
}

protocol WeatherFetching {
    func fetchCurrentWeather(for location: Location, completion: @escaping (Result<WeatherResponse, Error>) -> Void)
}


class WeatherAPIService: CityFetching, WeatherFetching {
    // Replace this with a more secure storage method in a production app
    private let apiKey = "a14f0721f2214e12a27174152241312"

    // MARK: - City Autocomplete
    
    /// Fetches city suggestions based on the user's query.
    func fetchCities(query: String, completion: @escaping (Result<[Location], Error>) -> Void) {
        guard let url = buildFetchCitiesURL(query: query) else {
            completion(.failure(URLError(.badURL)))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }

            do {
                let locations = try JSONDecoder().decode([Location].self, from: data)
                completion(.success(locations))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }

    /// Constructs the URL for the WeatherAPI search endpoint using URLComponents.
    private func buildFetchCitiesURL(query: String) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.weatherapi.com"
        components.path = "/v1/search.json"
        components.queryItems = [
            URLQueryItem(name: "key", value: apiKey),
            URLQueryItem(name: "q", value: query)
        ]

        return components.url
    }
    
    // MARK: - Fetch Weather
    
    /// Fetches the current weather for a given location.
    func fetchCurrentWeather(for location: Location, completion: @escaping (Result<WeatherResponse, Error>) -> Void) {
        guard let url = buildCurrentWeatherURL(location: location) else {
            completion(.failure(URLError(.badURL)))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }

            do {
                let weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
                completion(.success(weatherResponse))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }

    /// Constructs the URL for the current weather endpoint using a Location object.
    private func buildCurrentWeatherURL(location: Location) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.weatherapi.com"
        components.path = "/v1/current.json"
        components.queryItems = [
            URLQueryItem(name: "key", value: apiKey),
            URLQueryItem(name: "q", value: "\(location.lat),\(location.lon)")
        ]

        return components.url
    }
}
