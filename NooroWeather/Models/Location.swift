//
//  Location.swift
//  NooroWeather
//
//  Created by Matthew Johnson on 12/13/24.
//


import Foundation

struct Location: Identifiable, Codable {
    var id: String { "\(name), \(region), \(country)" }
    let name: String
    let region: String
    let country: String
    let lat: Double
    let lon: Double
    let tz_id: String?
    let localtime_epoch: Int?
    let localtime: String?
}

let sampleLocation = Location(name: "Boston", region: "Massachusetts", country: "United States", lat: 42.3601, lon: -71.0589, tz_id: nil, localtime_epoch: nil, localtime: nil)
