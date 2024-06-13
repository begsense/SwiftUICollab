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
                
                Snowing()
                
                ScrollView {
                    CurrentWeatherInfoView()
                    
                    AdditionalInfoView()
                    
                    HourlyForecastView()
                    
                    DailyForecastView(weekDay: "Monday", image: "Image", minTemp: "31°C", maxTemp: "27°C")
                }
                
                .padding(.top, 90)
            }

           

        }
    }
}


#Preview {
    WeatherView()
}
