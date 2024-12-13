//
//  HomeView.swift
//  NooroWeather
//
//  Created by Matthew Johnson on 12/13/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = CitySearchViewModel()
    @Environment(\.dismissSearch) private var dismissSearch
    
    var body: some View {
        NavigationStack {
            if !viewModel.searchText.isEmpty {
                List(viewModel.suggestions) { location in
                    Button {
                        viewModel.selectCity(location)
                        dismissSearch()
                        
                    } label: {
                        CitySearchCardView(location: location)
                    }
                }
                    
            } else if let selectedCity = viewModel.selectedCity {
                ScrollView {
                    CityWeatherView(location: selectedCity)
                        .padding(.top, 40)
                }
                
            } else {
                Text("No City Selected")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 4)
                
                Text("Please Search for a City")
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            
        }
        .searchable(text: $viewModel.searchText, prompt: "Search Location")
    }

}

#Preview {
    HomeView()
}
