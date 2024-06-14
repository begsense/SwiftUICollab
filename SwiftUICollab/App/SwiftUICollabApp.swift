//
//  SwiftUICollabApp.swift
//  SwiftUICollab
//
//  Created by M1 on 12.06.2024.
//

import SwiftData
import SwiftUI

@main
struct SwiftUICollabApp: App {
    @State private var selectedCity: String = "Tbilisi"
    var body: some Scene {
        WindowGroup {
            MainView(selectedCity: $selectedCity)
        }
        .modelContainer(for: City.self)
    }
}
