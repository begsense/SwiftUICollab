//
//  Forecast.swift
//  SwiftUICollab
//
//  Created by M1 on 12.06.2024.
//

import Foundation

struct Forecast: Decodable {
    struct Daily: Decodable {
        let dt: Date
        struct Temp: Decodable {
            let min: Double
            let max: Double
        }
        
        let temp: Temp
        
        struct Weather: Decodable {
            let icon: String
            var weatherIconURL: URL {
                let urlString = "https://openweathermap.org/img/wn/\(icon)@2x.png"
                return URL(string: urlString)!
            }
        }
        
        let weather: [Weather]
    }
    
    struct Hourly: Decodable {
        let dt: Date
        let temp: Double
        
        struct Weather: Decodable {
            let icon: String
            var weatherIconURL: URL {
                let urlString = "https://openweathermap.org/img/wn/\(icon)@2x.png"
                return URL(string: urlString)!
            }
        }
        
        let weather: [Weather]
    }
    
    struct Current: Decodable {
        let dt: Date
        let temp: Double
        let humidity: Int
        let dew_point: Double
        let uvi: Double
        let clouds: Int
        let visibility: Int
        let wind_speed: Double
        let weather: [Weather]
        
        struct Weather: Decodable {
            let main: String
            let icon: String
            let description: String
            var weatherIconURL: URL {
                let urlString = "https://openweathermap.org/img/wn/\(icon)@2x.png"
                return URL(string: urlString)!
            }
        }
    }
    
    let daily: [Daily]
    let hourly: [Hourly]
    let current: Current
}
