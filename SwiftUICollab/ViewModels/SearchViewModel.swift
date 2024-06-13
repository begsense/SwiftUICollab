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

class SearchViewModel: ObservableObject {
    @Published var cities: [City] = []
    @Published var errorMessage: String?
    
    private let networkService = NetworkService()
    private let cityAPIKey = "MmDtGhE02PkmgwzZ8vpung==hakrmbPcci8NwOeB"
    
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
}
