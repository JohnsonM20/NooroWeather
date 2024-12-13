//
//  TemperatureView.swift
//  NooroWeather
//
//  Created by Matthew Johnson on 12/13/24.
//


import SwiftUI

struct TemperatureView: View {
    let temperature: Double
    let fontSize: CGFloat

    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            Text("\(Int(temperature))")
                .font(.system(size: fontSize, weight: .semibold, design: .default))
            Text("°")
                .font(.system(size: fontSize * 0.5, weight: .regular))
                .padding(.leading, 5)
        }
    }
}

#Preview {
    VStack {
        TemperatureView(temperature: 75, fontSize: 55)
        TemperatureView(temperature: 25, fontSize: 35)
    }
}
