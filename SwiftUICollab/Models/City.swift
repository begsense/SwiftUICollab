//
//  City.swift
//  SwiftUICollab
//
//  Created by M1 on 12.06.2024.
//

import Foundation
import SwiftData

@Model
class City: Decodable, Hashable, Identifiable {
    var id = UUID()
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

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        latitude = try container.decodeIfPresent(Double.self, forKey: .latitude)
        longitude = try container.decodeIfPresent(Double.self, forKey: .longitude)
        country = try container.decodeIfPresent(String.self, forKey: .country)
        population = try container.decodeIfPresent(Int.self, forKey: .population)
        isCapital = try container.decodeIfPresent(Bool.self, forKey: .isCapital)
    }
}
