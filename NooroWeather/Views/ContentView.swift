//
//  ContentView.swift
//  NooroWeather
//
//  Created by Matthew Johnson on 12/13/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage(AppStorageKeys.presentSplashScreen) var presentSplashScreen: Bool = true
    
    var body: some View {
        if presentSplashScreen {
            SplashScreen()
        } else {
            HomeView()
        }
    }
}

#Preview {
    ContentView()
}
