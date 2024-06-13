//
//  DailyForecastView.swift
//  Weather
//
//  Created by Luka  Kharatishvili on 12.06.24.
//

import SwiftUI

struct DailyForecastView: View {
    @ObservedObject var viewModel = WeatherViewModel()
    var weekDay: String
    var image: String
    var minTemp: String
    var maxTemp: String

    var body: some View {
        VStack {
            if let forecast = viewModel.forecast {
                ForEach(forecast.daily, id: \.dt) { daily in
//                ForEach(0 ... 3, id: \.self) { daily in

                    HStack {
                        Text("asd")
//                        Text(DateFormatterManager.shared.hourlyDateFormatterDay.string(from: daily.dt))
                            .foregroundStyle(Color.white)
                        Text("avoe")
                        Spacer()
                        Text("Image")
                        Spacer()
                        HStack {
//                            Text("\(daily.temp.max)")
                            Text("asd")
                                .foregroundStyle(Color.white)
//                            Text("\(daily.temp.min)")
                            Text("asd")

                                .foregroundStyle(Color.white)
                                .opacity(0.5)
                        }
                    }
                    .padding(15)
                }
            }
        }
        .glassmorphism(blurStyle: .systemUltraThinMaterial, backgroundColor: Color(UIColor(named: "color") ?? .clear), cornerRadius: 20, blurOpacity: 0.85)
        .padding(.bottom, 14)
        .padding(.leading, 13)
        .padding(.trailing, 19)
        .padding(.top, 12)
    }
}
