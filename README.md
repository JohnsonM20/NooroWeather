# NooroWeather

NooroWeather is a simple weather app that allows users to search for cities and view real-time weather information.

## Features
- **Search Cities**: Autocomplete suggestions for city names.
- **Real-Time Weather**: View current temperature, humidity, UV index, and other weather details.
- **User Persistence**: Persist the selected city.

---

## Technologies Used
- **Swift** and **SwiftUI**
- **Combine** for reactive programming
- **URLSession** for network calls
- **WeatherAPI.com** for weather data
- **UserDefaults** for local persistence

---

## Setup Instructions

### Prerequisites
- iOS 17.0 or later (deployment target)
- A valid API key from [WeatherAPI.com](https://www.weatherapi.com/), or using mine already in the project

### Installation
1. **Clone the Repository**:

2. **Open in Xcode**:

3. **Add Your API Key (Or use mine)**:

4. **Run the Project**:
   
---

## Project Architecture

### Key Components
- **Models**:
  - `Location`: Represents a city or town.
  - `CurrentWeather`: Represents the real-time weather data.
    `WeatherResponse`: Represents the Location and CurrentWeather
- **ViewModels**:
  - `CitySearchViewModel`: Handles city search logic and persistence.
  - `WeatherViewModel`: Manages fetching and displaying weather data.
- **Services**:
  - `WeatherAPIService`: Handles network calls to WeatherAPI.com.
- **Views**:
  - Reusable SwiftUI components like `WeatherIconView` and `TemperatureView`.
  - I added a splash screen when the user first opens the app, with these components under the 'SplashScreen' folder

---

## Things I Would Have Done with More Time
1. **Secure API Key Storage**:
   - Avoid storing the API key in plaintext.

2. **Unit Testing**:
   - Write unit tests for critical components like `CitySearchViewModel` and `WeatherAPIService`

---
