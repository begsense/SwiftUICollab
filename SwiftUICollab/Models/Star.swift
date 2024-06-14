//
//  Star.swift
//  SwiftUICollab
//
//  Created by M1 on 14.06.2024.
//

import Foundation

struct Star: Identifiable {
    let id = UUID()
    let image: String
    let width: CGFloat
    let height: CGFloat
    let x: CGFloat
    let y: CGFloat
}

var stars = [
    Star(image: "Star", width: 15, height: 15, x: 20, y: 50),
    Star(image: "Star", width: 120, height: 120, x: 280, y: 30),
    Star(image: "Star", width: 70, height: 70, x: 150, y: 100),
    Star(image: "Star", width: 40, height: 40, x: 50, y: 150),
    Star(image: "Star", width: 15, height: 15, x: 250, y: 50),
    Star(image: "Star", width: 25, height: 25, x: 80, y: 220),
    Star(image: "Star", width: 55, height: 55, x: 320, y: 150),
    Star(image: "Star", width: 99, height: 99, x: 200, y: 80),
    Star(image: "Star", width: 8, height: 8, x: 180, y: 250),
    Star(image: "Star", width: 15, height: 15, x: 300, y: 220),
    Star(image: "Star", width: 25, height: 25, x: 100, y: 300),
    Star(image: "Star", width: 55, height: 55, x: 40, y: 350),
    Star(image: "Star", width: 99, height: 99, x: 150, y: 350),
    Star(image: "Star", width: 10, height: 10, x: 280, y: 320),
    Star(image: "Star", width: 10, height: 10, x: 100, y: 400)
]
