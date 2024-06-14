//
//  DailyForecastView.swift
//  Weather
//
//  Created by Luka  Kharatishvili on 12.06.24.
//

import SDWebImageSwiftUI
import SwiftUI

struct DailyForecastView: View {
    let dailyForecasts: [Forecast.Daily]
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter
    }

    var body: some View {
        VStack(alignment: .leading) {
            VStack(spacing: 12) {
                ForEach(dailyForecasts, id: \.dt) { daily in
                    HStack {
                        VStack(alignment: .leading) {
                            HStack {
                                Text(dateFormatter.string(from: daily.dt))
                                    .shadow(color: Color.black.opacity(0.3), radius: 1, x: -2, y: 3)
                                    .shadow(color: Color.white.opacity(0.25), radius: 2, x: -1, y: 1)
                                Spacer()
                            }
                            .foregroundStyle(Color.white)
                        }

                        Spacer()

                        if let weatherIconURL = daily.weather.first?.weatherIconURL {
                            WebImage(url: weatherIconURL)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 75, height: 75)
                        }

                        Spacer()

                        VStack(alignment: .trailing) {
                            HStack {
                                Spacer()
                                HStack(spacing: 0) {
                                    Text("\(Int(daily.temp.max))")
                                        .font(.custom("AlegreyaSans-Bold", size: 18))

                                    Text("°C")
                                        .font(.custom("AlegreyaSans-Bold", size: 10))
                                }
                                .foregroundStyle(Color.white)

                                HStack(spacing: 0) {
                                    Text("\(Int(daily.temp.min))")
                                        .font(.custom("AlegreyaSans-Bold", size: 18))

                                    Text("°C")
                                        .font(.custom("AlegreyaSans-Bold", size: 10))
                                }
                                .foregroundStyle(Color.white).opacity(0.5)
                            }
                            .frame(width: 100)
                        }
                        .font(.custom("AlegreyaSans-Bold", size: 18))
                    }
                    .frame(width: 300, height: 50)
                    .shadow(color: Color.black.opacity(0.1), radius: 1, x: -2, y: 3)
                    .shadow(color: Color.white.opacity(0.25), radius: 2, x: -1, y: 1)
                    .padding(.horizontal)
                }
            }
            .padding(.leading, 13)
            .padding(.trailing, 19)
        }
        .glassmorphism(blurStyle: .systemUltraThinMaterial, backgroundColor: Color(UIColor(named: "color") ?? .clear), cornerRadius: 20, blurOpacity: 0.85)
        .padding(.leading, 13)
        .padding(.trailing, 19)
    }
}
