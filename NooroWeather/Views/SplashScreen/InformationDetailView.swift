//
//  InformationDetailView.swift
//  NooroWeather
//
//  Created by Matthew Johnson on 12/13/24.
//

import SwiftUI

struct InformationDetailView: View {
    var title: String
    var imageName: String

    var body: some View {
        HStack(alignment: .center) {
            
            Image(systemName: imageName)
                .font(.largeTitle)
                .foregroundColor(.blue)
                .padding()
                .accessibility(hidden: true)
                .frame(minWidth: 50, idealWidth: 50, maxWidth: 50)

            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .accessibility(addTraits: .isHeader)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(.top)
    }
}

#Preview {
    InformationDetailView(title: "Get real-time weather updates for any city", imageName: "cloud.sun.fill")
}
