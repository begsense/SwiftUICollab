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
                animationView
                GeometryReader { geometry in
                    MenuView(selectedCity: $selectedCity)
                        .frame(width: 170, height: 36)
                        .offset(x: geometry.size.width - 140, y: geometry.safeAreaInsets.top - 36)
                        .ignoresSafeArea()
                }
 
                ScrollView {
                    CurrentWeatherInfoView(temperature: Int(temperature), maxTemp: Int(maxTemp), minTemp: Int(minTemp), description: viewModel.forecast?.current.weather.first?.description ?? "")
 
                    AdditionalInfoView(humidity: humidity, uvi: uvi, windSpeed: windSpeed)
 
                    if (viewModel.forecast?.hourly) != nil {
                        HourlyForecastView(
                            timezoneIdentifier: DateFormatterManager.shared.timezoneIdentifier,
                            hourlyForecasts: $viewModel.forecastHourdly,
                            timezoneOffset: $viewModel.timezoneOffset
                        )
                    }
 
                    if let dailyForecasts = viewModel.forecast?.daily {
                        DailyForecastView(dailyForecasts: dailyForecasts)
                    }
                }
 
                .scrollIndicators(.hidden)
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
            viewModel.updateViewState()
            viewModel.updateIsNight()
        }
        .onChange(of: selectedCity) { _, newCity in
            viewModel.getWeatherForecast(for: newCity)
//            viewModel.updateIsNight()
        }
    }
 
    private var animationView: some View {
        switch viewModel.viewState {
        case .sunny:
            return viewModel.isNight ? AnyView(WarmNight()) : AnyView(BirdView())
        case .cloudy:
            return viewModel.isNight ? AnyView(WarmCloudy()) : AnyView(CloudView())
        case .rainy:
            return viewModel.isNight ? AnyView(NightRaining()) : AnyView(Raining())
        case .snowy:
            return viewModel.isNight ? AnyView(NightSnowing()) : AnyView(Snowing())
        }
    }
}
