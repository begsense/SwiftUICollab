//
//  AdditionalInfoView.swift
//  SwiftUICollab
//
//  Created by Luka  Kharatishvili on 13.06.24.
//

import SwiftUI

struct AdditionalInfoView: View {
    @StateObject var viewModel = WeatherViewModel()
    var humidity: Int?
    var uvi: Double?
    var windSpeed: Double?
    
    var body: some View {
        HStack(alignment: .center, spacing: 30) {
            HStack(spacing: 5) {
                Image("rainProb")
                
                Text("\(humidity ?? 0)")
            }
            .padding([.leading, .trailing], 10.5)
            .padding([.top, .bottom], 5)
            
            HStack(spacing: 5) {
                Image("humidity")
                
                Text(String(format: "%.1f", uvi ?? 0.0))
            }
            .padding([.leading, .trailing], 10.5)
            .padding([.top, .bottom], 5)
            
            HStack(spacing: 5) {
                Image("windSp")
                Text(String(format: "%.1f", windSpeed ?? 0.0))
            }
            .padding([.leading, .trailing], 10.5)
            .padding([.top, .bottom], 6)
        }
        .frame(height: 47)
        .glassmorphism(blurStyle: .systemUltraThinMaterial, backgroundColor: Color(UIColor(named: "color") ?? .clear), cornerRadius: 20, blurOpacity: 0.85)
        .foregroundStyle(Color.white)
        .padding(.leading, 13)
        .padding(.trailing, 20)
        .padding(.bottom, 12)
    }
}

