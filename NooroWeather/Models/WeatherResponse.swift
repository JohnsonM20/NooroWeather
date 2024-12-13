//
//  WeatherResponse.swift
//  NooroWeather
//
//  Created by Matthew Johnson on 12/13/24.
//


struct WeatherResponse: Codable {
    let location: Location
    let current: CurrentWeather
}