//
//  HourlyForecastView.swift
//  Weather
//
//  Created by Luka  Kharatishvili on 12.06.24.
//

import SDWebImageSwiftUI
import SwiftUI

struct HourlyForecastView: View {
    @State var timezoneIdentifier: String
    @Binding private var hourlyForecasts: [Forecast.Hourly]
    @Binding private var timezoneOffset: Int

    init(timezoneIdentifier: String, hourlyForecasts: Binding<[Forecast.Hourly]>, timezoneOffset: Binding<Int>) {
        self.timezoneIdentifier = timezoneIdentifier
        _hourlyForecasts = hourlyForecasts
        _timezoneOffset = timezoneOffset
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
                    

                Spacer()

                Text(hourlyDateFormatterDay.string(from: Date()))
                    .fontWeight(.regular)
                    .foregroundStyle(Color.white)

            }
            .padding(.top, 12)
            .padding(.horizontal)

            ScrollView(.horizontal) {
                HStack(spacing: 12) {
                    ForEach(hourlyForecasts, id: \.dt) { hourly in
                        VStack(alignment: .center) {
                            Text("\(Int(hourly.temp)) °C")


                            if let weatherIconURL = hourly.weather.first?.weatherIconURL {
                                WebImage(url: weatherIconURL)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 75, height: 75)
                            }
                            Text(DateFormatterManager.shared.formatTime(date: hourly.dt, timezoneOffset: timezoneOffset))

                        }
                        .padding(.top, 13)
                        .padding(.bottom, 20)
                        .frame(width: 70)
                        .frame(minHeight: 155)
                        .foregroundColor(Color.white)

                        .viewModifier(if: hourly.dt == hourlyForecasts.first?.dt) { view in
                            view.glassmorphism(backgroundColor: Color(UIColor(named: "white1") ?? .clear), cornerRadius: 20, blurOpacity: 1)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(LinearGradient(gradient: Gradient(colors: [Color("borderTop"), Color("borderBottom")]), startPoint: .top, endPoint: .bottom), lineWidth: 1)
                                )
                        }
                    }
                    .padding(.bottom, 14)
                }
            }
            .scrollIndicators(.hidden)
            .padding(.horizontal)
        }
        .shadow(color: Color.black.opacity(0.3  ), radius: 1, x: -2, y: 3)
        .shadow(color: Color.white.opacity(0.25), radius: 2, x: -1, y: 1)
        .glassmorphism(blurStyle: .systemUltraThinMaterial, backgroundColor: Color(UIColor(named: "color") ?? .clear), cornerRadius: 20, blurOpacity: 0.85)
        .padding(.horizontal)
    }
}

extension View {
    @ViewBuilder
    func viewModifier<Content: View>(if condition: Bool, content: (Self) -> Content) -> some View {
        if condition {
            content(self)
        } else {
            self
        }
    }
}
