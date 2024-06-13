//
//  CloudModel.swift
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
