//
//  WeatherView.swift
//  SwiftUICollab
//
//  Created by M1 on 12.06.2024.
//

import SDWebImageSwiftUI
import SwiftUI

struct WeatherView: View {
    @Binding var selectedCity: String
    @StateObject private var viewModel = WeatherViewModel()

    var body: some View {
        let temperature = viewModel.forecast?.current.temp ?? 00.00
        let maxTemp = viewModel.forecast?.daily.first?.temp.max ?? 00.00
        let minTemp = viewModel.forecast?.daily.first?.temp.min ?? 00.00
        let humidity = viewModel.forecast?.current.humidity
        let uvi = viewModel.forecast?.current.uvi
        let windSpeed = viewModel.forecast?.current.wind_speed

        NavigationStack {
            ZStack {
                GeometryReader { geometry in
                    MenuView(selectedCity: $selectedCity)
                        .frame(width: 170, height: 36)
                        .offset(x: geometry.size.width - 140, y: geometry.safeAreaInsets.top - 36)
                        .ignoresSafeArea()
                }

                Image("Sun")
                    .resizable()
                    .frame(width: 138, height: 138)
                    .scaledToFit()
                    .position(x: 100, y: 100)
                
               // animationView

                ScrollView {
                    CurrentWeatherInfoView(temperature: Int(temperature), maxTemp: Int(maxTemp), minTemp: Int(minTemp))

                    AdditionalInfoView(humidity: humidity, uvi: uvi, windSpeed: windSpeed)

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
        }
        .onAppear {
            viewModel.getWeatherForecast(for: selectedCity)
        }
        .onChange(of: selectedCity) { _, newCity in
            viewModel.getWeatherForecast(for: newCity)
        }
    }
    
    private var animationView: some View {
        switch viewModel.viewState {
        case .sunny:
            Text("sunny animation")
        case .cloudy:
            Text("cloudy animation")
        case .rainy:
            Text("rainy animation")
        case .snowy:
            Text("snowy animation")
        }
    }
}
