//
//  StarModel.swift
//  SwiftUICollab
//
//  Created by Elene Donadze on 6/13/24.
//

import Foundation
import Foundation

struct Star: Identifiable {
    let id = UUID()
    let image: String
    let width: CGFloat
    let height: CGFloat
    let x: CGFloat
    let y: CGFloat
}
