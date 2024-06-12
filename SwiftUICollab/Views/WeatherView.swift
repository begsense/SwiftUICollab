//
//  WeatherView.swift
//  SwiftUICollab
//
//  Created by M1 on 12.06.2024.
//

import SwiftUI

struct WeatherView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    WeatherView()
}
