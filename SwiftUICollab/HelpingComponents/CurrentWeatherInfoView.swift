//
//  CurrentWeatherInfoView.swift
//  SwiftUICollab
//
//  Created by Luka  Kharatishvili on 13.06.24.
//

import SwiftUI

struct CurrentWeatherInfoView: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("30º")
                .font(.system(size: 64))
                .fontWeight(.semibold)
            Text("Precipitations")
            Text("Max.: 34º   Min.: 28º")
                .padding(.bottom, 20)
        }
        .glassmorphism(blurStyle: .systemUltraThinMaterial, backgroundColor: Color(UIColor(named: "color") ?? .clear), cornerRadius: 20, blurOpacity: 0.4)

        .padding(.leading, 13)
        .padding(.trailing, 20)
        .padding(.bottom, 12)
        .foregroundStyle(Color.white)
    }
}

#Preview {
    CurrentWeatherInfoView()
}
