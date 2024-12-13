//
//  SplashScreen.swift
//  NooroWeather
//
//  Created by Matthew Johnson on 12/13/24.
//

import SwiftUI

struct SplashScreen: View {
    @AppStorage(AppStorageKeys.presentSplashScreen) var presentSplashScreen: Bool = true
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {

                Spacer()

                TitleView()
                InformationContainerView()
            }
        }
        
        Button(action: {
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.success)
            presentSplashScreen = false
        }) {
            Text("Continue")
                .bold()
                .foregroundColor(.white)
                .font(.headline)
                .padding()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                .background(RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color.blue))
                .padding(.bottom)
                .padding(.horizontal)
                .padding(.horizontal)
                .frame(maxWidth: 450)
        }
    }
}

#Preview {
    SplashScreen()
}
