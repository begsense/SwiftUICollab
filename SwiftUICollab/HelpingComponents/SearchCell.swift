//
//  SearchCell.swift
//  SwiftUICollab
//
//  Created by M1 on 12.06.2024.
//

import SwiftUI

struct SearchCell: View {
    @State var cityName: String = "testName"
    @State var weatherCase: String = "testRainy"
    @State var celsius: String = "testCel"
    // rgba(46, 176, 221, 1) rgba(142, 173, 225, 1)

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(cityName)
                    .font(.custom("SF Pro Display", size: 25))

                Spacer()
                    .frame(height: 12)

                Text(weatherCase)
                    .font(.custom("SF Pro Display", size: 10))
            }
            .padding(.leading, 15)
            .foregroundStyle(Color.white)

            Spacer()

            Text(celsius)
                .font(.custom("SF Pro Display", size: 53))
                .foregroundStyle(Color.white)
                .padding(.trailing, 10)
        }
        .frame(minHeight: 77)
        .background(LinearGradient(colors: [Color(red: 46 / 255, green: 176 / 255, blue: 221 / 255, opacity: 1), Color(red: 142 / 255, green: 173 / 255, blue: 225 / 255, opacity: 1)], startPoint: .top, endPoint: .bottom))
        .cornerRadius(16)
    }
}

#Preview {
    SearchCell()
}
