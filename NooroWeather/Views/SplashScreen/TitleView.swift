//
//  TitleView.swift
//  NooroWeather
//
//  Created by Matthew Johnson on 12/13/24.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        VStack {
            Text("Welcome to")
                .customTitleText()

            Text("NooroWeather")
                .customTitleText()
                .foregroundColor(.blue)
        }
    }
}

#Preview {
    TitleView()
}

extension Text {
    func customTitleText() -> Text {
        self
            .fontWeight(.black)
            .font(.system(size: 36))
    }
}
