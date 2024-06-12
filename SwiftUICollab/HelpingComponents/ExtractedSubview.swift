//
//  ExtractedSubview.swift
//  Weather
//
//  Created by Luka  Kharatishvili on 12.06.24.
//

import SwiftUI

struct ExtractedView: View {
    var weekDay: String
    var image: String
    var minTemp: String
    var maxTemp: String
    var body: some View {
        VStack {
            ForEach(0 ... 3, id: \.self) { _ in
                HStack {
                    Text("Monday")
                        .foregroundStyle(Color.white)
                    Spacer()
                    Text("Image")
                    Spacer()
                    HStack {
                        Text("31°C")
                            .foregroundStyle(Color.white)
                        Text("19°C")
                            .foregroundStyle(Color.white)
                            .opacity(0.5)
                    }
                }
                .padding(15)
            }
        }

        .glassmorphism(blurStyle: .systemUltraThinMaterial, backgroundColor: Color(UIColor(named: "color") ?? .clear), cornerRadius: 20, blurOpacity: 1)
        .padding(.bottom, 14)
        .padding(.leading, 13)
        .padding(.trailing, 19)
        .padding(.top, 21)
    }
}

#Preview {
    ExtractedView(weekDay: "Monday", image: "Image", minTemp: "31°C", maxTemp: "29°C")
}
