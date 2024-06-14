//
//  CurrentWeatherInfoView.swift
//  SwiftUICollab
//
//  Created by Luka  Kharatishvili on 13.06.24.
//

import SwiftUI

struct CurrentWeatherInfoView: View {
    @State private var scrollOffset: CGFloat = 0
    
    var temperature: Int
    var maxTemp: Int
    var minTemp: Int
    var description: String
    var body: some View {
        
        VStack(alignment: .center) {
            Text("\(temperature)º")
                .font(.system(size: 64))
                .fontWeight(.semibold)
            
            Text(description.capitalized)
            
            HStack {
                Text("Max.: \(maxTemp)º")
                Text("Min.: \(minTemp)º")
            }
            .padding(.bottom, 20)
        }
        .glassmorphism(blurStyle: .systemUltraThinMaterial, backgroundColor: Color(UIColor(named: "color") ?? .clear), cornerRadius: 20, blurOpacity: 0.4)
        .padding(.leading, 13)
        .padding(.trailing, 20)
        .padding(.bottom, 22)
        .foregroundStyle(Color.white)
    }
}
