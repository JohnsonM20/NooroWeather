//
//  WeatherIconView.swift
//  NooroWeather
//
//  Created by Matthew Johnson on 12/13/24.
//


import SwiftUI

struct WeatherIconView: View {
    let iconURL: String
    let size: CGFloat

    var body: some View {
        AsyncImage(url: URL(string: "https:\(iconURL)")) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        } placeholder: {
            ProgressView()
        }
        .frame(width: size, height: size)
    }
}

#Preview {
    WeatherIconView(iconURL: "//cdn.weatherapi.com/weather/64x64/day/113.png", size: 150)
}
