//
//  InformationContainerView.swift
//  NooroWeather
//
//  Created by Matthew Johnson on 12/13/24.
//

import SwiftUI

struct InformationContainerView: View {
    var body: some View {
        VStack(alignment: .leading) {
            InformationDetailView(title: "Get real-time weather updates for any city", imageName: "cloud.sun.fill")

            InformationDetailView(title: "Track temperature, UV index, and humidity levels", imageName: "thermometer")
            
        }
        .padding(.horizontal)
    }
}

#Preview {
    InformationContainerView()
}
