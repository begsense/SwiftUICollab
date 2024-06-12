//
//  HourlyForecastView.swift
//  Weather
//
//  Created by Luka  Kharatishvili on 12.06.24.
//

import SwiftUI

struct HourlyForecastView: View {
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
                Text("Jun, 11")
                    .fontWeight(.regular)
                    .foregroundStyle(Color.white)
                    .shadow(color: Color.black.opacity(0.3), radius: 1, x: -2, y: 3)
                    .shadow(color: Color.white.opacity(0.25), radius: 2, x: -1, y: 1)
            }
            .padding(.top, 12)
            .padding(.leading, 16)
            .padding(.trailing, 18)
            
            HStack(spacing: 12) {
                ForEach(0 ... 3, id: \.self) { hour in
                    VStack(alignment: .center) {
                        Text("31°C")
                            .padding(.bottom, 30)
                            .shadow(color: Color.black.opacity(0.3), radius: 1, x: -2, y: 3)
                            .shadow(color: Color.white.opacity(0.25), radius: 2, x: -1, y: 1)
                        Image("Union")
                            .resizable()
                            .frame(width: 34, height: 21)
                            .padding(.bottom, 25)
                        
                        Text("15:00")
                            .shadow(color: Color.black.opacity(0.3), radius: 1, x: -2, y: 3)
                            .shadow(color: Color.white.opacity(0.25), radius: 2, x: -1, y: 1)
                    }
                    .frame(width: 70, height: 175)
                    .foregroundStyle(Color.white)
                    .shadow(color: Color.black.opacity(0.1), radius: 1, x: -2, y: 3)
                    .shadow(color: Color.white.opacity(0.25), radius: 2, x: -1, y: 1)
                    .if(hour == 0) { view in
                        view.glassmorphism(backgroundColor: Color(UIColor(named: "white1") ?? .clear), cornerRadius: 20, blurOpacity: 1)
                        
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(LinearGradient(gradient: Gradient(colors: [Color("borderTop"), Color("borderBottom")]), startPoint: .top, endPoint: .bottom), lineWidth: 1)
                            )
                    }
                }
            }
            .padding(.bottom, 14)
            .padding(.leading, 13)
            .padding(.trailing, 19)
        }
        .glassmorphism(blurStyle: .systemUltraThinMaterial, backgroundColor: Color(UIColor(named: "color") ?? .clear), cornerRadius: 20, blurOpacity: 0.85)
        .padding(.leading, 13)
        .padding(.trailing, 19)
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
#Preview {
    HourlyForecastView()
}
