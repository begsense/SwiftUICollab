//
//  WeatherView.swift
//  SwiftUICollab
//
//  Created by M1 on 12.06.2024.
//

import SwiftUI

struct WeatherView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                GeometryReader { geometry in
                    MenuView()
                        .frame(width: 170, height: 36)
                        .offset(x: geometry.size.width - 140, y: geometry.safeAreaInsets.top - 36)
                        .ignoresSafeArea()
                }

                Image("Sun")
                    .resizable()
                    .frame(width: 138, height: 138)
                    .scaledToFit()
                    .position(x: 100, y: 100)

                ScrollView {
                    CurrentWeatherInfoView()

                    AdditionalInfoView()

                    HourlyForecastView()

                    DailyForecastView(weekDay: "Monday", image: "Image", minTemp: "31°C", maxTemp: "27°C")
                }

                .padding(.top, 90)
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [Color("sunnyTop"), Color("sunnyBottom")]),
                               startPoint: .top,
                               endPoint: .bottom)
            )

            .background(
                LinearGradient(gradient: Gradient(colors: [Color("rainyTop"), Color("rainyBottom")]),
                               startPoint: .top,
                               endPoint: .bottom)
            )
        }
    }
}

#Preview {
    WeatherView()
}
