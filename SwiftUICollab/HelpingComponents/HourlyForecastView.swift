//
//  HourlyForecastView.swift
//  Weather
//
//  Created by Luka  Kharatishvili on 12.06.24.
//

import SwiftUI
import SDWebImageSwiftUI
struct HourlyForecastView: View {
    let hourlyForecasts: [Forecast.Hourly]
    var hourlyDateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }
    var hourlyDateFormatterDay: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d"
        return formatter
    }
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Text("Today")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
                    .blur(radius: 0.25)
                    .shadow(color: Color.black.opacity(0.3), radius: 1, x: -2, y: 3)
                    .shadow(color: Color.white.opacity(0.25), radius: 2, x: -1, y: 1)
                
                Spacer()
                
                Text(hourlyDateFormatterDay.string(from: Date()))
                    .fontWeight(.regular)
                    .foregroundStyle(Color.white)
                    .shadow(color: Color.black.opacity(0.3), radius: 1, x: -2, y: 3)
                    .shadow(color: Color.white.opacity(0.25), radius: 2, x: -1, y: 1)
            }
            .padding(.top, 12)
            .padding(.horizontal)
            
            ScrollView(.horizontal) {
                HStack(spacing: 12) {
                    ForEach(hourlyForecasts, id: \.dt) { hourly in
                        VStack(alignment: .center) {
                            Text("\(Int(hourly.temp)) °C")
                                .padding(.bottom, 30)
                                .shadow(color: Color.black.opacity(0.3), radius: 1, x: -2, y: 3)
                                .shadow(color: Color.white.opacity(0.25), radius: 2, x: -1, y: 1)
                            
                            if let weatherIconURL = hourly.weather.first?.weatherIconURL {
                                WebImage(url: weatherIconURL)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 75, height: 75)
                                    .padding(.bottom, 20)
                            }
                            
                            Text(hourlyDateFormatter.string(from: hourly.dt))
                                .shadow(color: Color.black.opacity(0.3), radius: 1, x: -2, y: 3)
                                .shadow(color: Color.white.opacity(0.25), radius: 2, x: -1, y: 1)
                        }
                        .frame(width: 70, height: 175)
                        .foregroundColor(Color.white)
                        .shadow(color: Color.black.opacity(0.1), radius: 1, x: -2, y: 3)
                        .shadow(color: Color.white.opacity(0.25), radius: 2, x: -1, y: 1)
                    }
                }
            }
            .scrollIndicators(.hidden)
            .padding(.bottom, 14)
            .padding(.horizontal)
        }
        .glassmorphism(blurStyle: .systemUltraThinMaterial, backgroundColor: Color(UIColor(named: "color") ?? .clear), cornerRadius: 20, blurOpacity: 0.85)
        .padding(.horizontal)
    }
}

extension View {
    @ViewBuilder
    func `if`<Content: View>(_ condition: Bool, content: (Self) -> Content) -> some View {
        if condition {
            content(self)
        } else {
            self
        }
    }
}
