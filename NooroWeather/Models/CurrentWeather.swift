//
//  CurrentWeather.swift
//  NooroWeather
//
//  Created by Matthew Johnson on 12/13/24.
//


struct CurrentWeather: Codable {
    struct Condition: Codable {
        let text: String
        let icon: String
        let code: Int
    }

    let last_updated: String
    let temp_c: Double
    let temp_f: Double
    let feelslike_c: Double
    let feelslike_f: Double
    let is_day: Int
    let condition: Condition
    let wind_mph: Double
    let wind_kph: Double
    let wind_degree: Int
    let wind_dir: String
    let pressure_mb: Double
    let pressure_in: Double
    let precip_mm: Double
    let precip_in: Double
    let humidity: Int
    let cloud: Int
    let windchill_c: Double
    let windchill_f: Double
    let heatindex_c: Double
    let heatindex_f: Double
    let dewpoint_c: Double
    let dewpoint_f: Double
    let vis_km: Double
    let vis_miles: Double
    let uv: Double
    let gust_mph: Double
    let gust_kph: Double
}

let sampleCondition = CurrentWeather.Condition(
    text: "Sunny",
    icon: "//cdn.weatherapi.com/weather/64x64/day/113.png",
    code: 1000
)

let sampleCurrentWeather = CurrentWeather(
    last_updated: "2024-12-13 15:00",
    temp_c: 25.0,
    temp_f: 77.0,
    feelslike_c: 27.0,
    feelslike_f: 80.6,
    is_day: 1,
    condition: sampleCondition,
    wind_mph: 10.0,
    wind_kph: 16.1,
    wind_degree: 180,
    wind_dir: "S",
    pressure_mb: 1015.0,
    pressure_in: 29.97,
    precip_mm: 0.0,
    precip_in: 0.0,
    humidity: 40,
    cloud: 10,
    windchill_c: 25.0,
    windchill_f: 77.0,
    heatindex_c: 27.0,
    heatindex_f: 80.6,
    dewpoint_c: 10.0,
    dewpoint_f: 50.0,
    vis_km: 16.0,
    vis_miles: 10.0,
    uv: 5.0,
    gust_mph: 15.0,
    gust_kph: 24.1
)
