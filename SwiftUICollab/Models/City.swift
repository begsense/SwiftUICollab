//
//  City.swift
//  SwiftUICollab
//
//  Created by M1 on 12.06.2024.
//

import Foundation

struct City: Codable {
    let name: String?
    let latitude: Double?
    let longitude: Double?
    let country: String?
    let population: Int?
    let isCapital: Bool?
    
    enum CodingKeys: String, CodingKey {
        case name
        case latitude
        case longitude
        case country
        case population
        case isCapital = "is_capital"
    }
}

