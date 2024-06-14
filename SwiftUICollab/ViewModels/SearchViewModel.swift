//
//  SearchViewModel.swift
//  SwiftUICollab
//
//  Created by Luka  Kharatishvili on 13.06.24.
//

import Foundation

// class SearchViewModel: ObservableObject {
//    @Published var cities: City?
//    @Published var forecast: Forecast?
//    @Published var errorMessage: String?
//
//    private let networkService = NetworkService()
//    private let cityAPIKey = "MmDtGhE02PkmgwzZ8vpung==hakrmbPcci8NwOeB"
//    private let weatherAPIKey = "439d4b804bc8187953eb36d2a8c26a02"
//
//    enum ViewState {
//        case sunny
//        case cloudy
//        case rainy
//        case snowy
//    }

import Foundation

class SearchViewModel: ObservableObject {
    enum ViewState {
        case sunny
        case cloudy
        case rainy
        case snowy
    }

    @Published var viewState: ViewState = .sunny

    @Published var cities: [City] = []
    @Published var forecasts: [String: Forecast] = [:]
    @Published var errorMessage: String?
    private let networkService = NetworkService()
    private let cityAPIKey = "mL11N1OcSvHnMzpXwoIQ+w==ybPPjPTdov7XklZ9"
    private let weatherAPIKey = "439d4b804bc8187953eb36d2a8c26a02"

    func getCities(withName cityName: String) {
        let encodedLocation = cityName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let baseURL = "https://api.api-ninjas.com/v1/city?name=\(encodedLocation)&san&limit=10"
        let headers = ["X-Api-Key": cityAPIKey]

        networkService.getData(urlString: baseURL, headers: headers) { (result: Result<[City], Error>) in
            switch result {
            case let .success(cities):
                self.cities = cities
            case let .failure(error):
                self.errorMessage = error.localizedDescription
            }
        }
    }

    func getWeatherForecast(for city: String) {
        let baseURL = "https://api.api-ninjas.com/v1/city?name=\(city)"
        let headers = ["X-Api-Key": cityAPIKey]

        networkService.getData(urlString: baseURL, headers: headers) { (result: Result<[City], Error>) in
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
                    self.forecasts[city.name ?? ""] = forecast
                }
            case let .failure(error):
                self.errorMessage = error.localizedDescription
            }
        }
    }

//    func updateViewState() {
//        let city: City
////        Text("\()")
//
////        let main = forecasts[city.name ?? ""]?.current.weather.first?.main ?? ""
//        switch main.lowercased() {
//        case "clear":
//            viewState = .sunny
//        case "clouds":
//            viewState = .cloudy
//        case "rain":
//            viewState = .rainy
//        case "snow":
//            viewState = .snowy
//        default:
//            viewState = .sunny
//        }
//    }
}
