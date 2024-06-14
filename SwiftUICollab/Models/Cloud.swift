//
//  Cloud.swift
//  SwiftUICollab
//
//  Created by M1 on 14.06.2024.
//

import Foundation

struct Cloud: Identifiable {
    let id = UUID()
    let image: String
    let width: CGFloat
    let height: CGFloat
    let x: CGFloat
    let y: CGFloat
}

var clouds = [
    Cloud(image: "Cloud", width: 180, height: 100, x: 300, y: 100),
    Cloud(image: "Cloud2", width: 120, height: 80, x: 29, y: 5),
    Cloud(image: "Cloud", width: 50, height: 30, x: 54, y: 259),
    Cloud(image: "Cloud", width: 30, height: 10, x: 10, y: 400),
    Cloud(image: "Cloud2", width: 40, height: 23, x: 200, y: 200),
    Cloud(image: "Cloud", width: 80, height: 50, x: 54, y: 259),
    Cloud(image: "Cloud", width: 150, height: 50, x: 300, y: 100),
    Cloud(image: "Cloud", width: 80, height: 40, x: 35, y: 99),
    Cloud(image: "Cloud2", width: 100, height: 50, x: 200, y: 15)
]
