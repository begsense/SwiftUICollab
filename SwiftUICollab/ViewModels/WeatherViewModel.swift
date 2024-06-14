//
//  WeatherViewModel.swift
//  SwiftUICollab
//
//  Created by M1 on 12.06.2024.
//

import Foundation

class WeatherViewModel: ObservableObject {
    @Published var cities: City?
    @Published var forecast: Forecast?
    @Published var forecastHourdly: [Forecast.Hourly] = []
    @Published var timezoneOffset = 1440
    @Published var errorMessage: String?
    @Published var viewState: ViewState = .sunny
    @Published var isNight = false
 
    private let networkService = NetworkService()
    private let cityAPIKey = "mf8lCk+ZP9c48uvyBC4wLA==SNVWJlVpDoYAeCTn"
    private let weatherAPIKey = "439d4b804bc8187953eb36d2a8c26a02"
 
    enum ViewState {
        case sunny
        case cloudy
        case rainy
        case snowy
    }
 
    func getWeatherForecast(for location: String) {
        let encodedLocation = location.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let baseURL = "https://api.api-ninjas.com/v1/city?name=\(encodedLocation)"
        let headers = ["X-Api-Key": cityAPIKey]
 
        networkService.getData(urlString: baseURL, headers: headers) { (result: Result<[City], Error>) in
            DispatchQueue.main.async {
                switch result {
                case let .success(cities):
                    if let city = cities.first {
                        self.fetchWeatherForecast(for: city)
                    } else {
                        self.errorMessage = "No city found"
                    }
                case let .failure(error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
 
    private func fetchWeatherForecast(for city: City) {
        guard let lat = city.latitude, let lon = city.longitude else {
            errorMessage = "Invalid coordinates"
            return
        }
 
        let baseURL = "https://openweathermap.org/data/2.5/onecall"
        var components = URLComponents(string: baseURL)!
 
        components.queryItems = [
            URLQueryItem(name: "lat", value: String(lat)),
            URLQueryItem(name: "lon", value: String(lon)),
            URLQueryItem(name: "units", value: "metric"),
            URLQueryItem(name: "appid", value: weatherAPIKey),
        ]
 
        guard let url = components.url else {
            errorMessage = "Invalid URL"
            return
        }
 
        networkService.getData(urlString: url.absoluteString, dateDecodingStrategy: .secondsSince1970) { (result: Result<Forecast, Error>) in
            switch result {
            case let .success(forecast):
                DispatchQueue.main.async {
                    self.forecast = forecast
                    self.forecastHourdly = forecast.hourly
                    self.timezoneOffset = forecast.timezone_offset
                    self.updateViewState()
                    self.updateIsNight()
                }
            case let .failure(error):
                self.errorMessage = error.localizedDescription
            }
        }
    }
    
    func updateIsNight() {
        let sunset = Int(forecast?.current.sunset.timeIntervalSince1970 ?? 0.0)
        let sunrise = Int(forecast?.current.sunrise.timeIntervalSince1970 ?? 0.0)
        let now = Int(forecast?.current.dt.timeIntervalSince1970 ?? 0.0)
 
        if (now > sunrise) && (now < sunset) {
            isNight = false
        } else {
            isNight = true
        }
    }
 
    func updateViewState() {
        let main = forecast?.current.weather.first?.main ?? ""
        switch main.lowercased() {
        case "clear":
            viewState = .sunny
        case "clouds":
            viewState = .cloudy
        case "rain":
            viewState = .rainy
        case "snow":
            viewState = .snowy
        default:
            viewState = .sunny
        }
    }
}
