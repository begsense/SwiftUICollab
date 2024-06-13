//
//  AdditionalInfoView.swift
//  SwiftUICollab
//
//  Created by Luka  Kharatishvili on 13.06.24.
//

import SwiftUI

struct AdditionalInfoView: View {
    var body: some View {
        HStack(alignment: .center, spacing: 30) {
            HStack(spacing: 5) {
                Text("icon")
                Text("18%")
            }
            .padding([.leading, .trailing], 10.5)
            .padding([.top, .bottom], 5)

            HStack(spacing: 5) {
                Text("icon")
                Text("67%")
            }
            .padding([.leading, .trailing], 10.5)
            .padding([.top, .bottom], 5)

            HStack(spacing: 5) {
                Text("icon")
                Text("25%")
            }
            .padding([.leading, .trailing], 10.5)
            .padding([.top, .bottom], 6)
        }
        .frame(height: 47)
        .glassmorphism(blurStyle: .systemUltraThinMaterial, backgroundColor: Color(UIColor(named: "color") ?? .clear), cornerRadius: 20, blurOpacity: 0.85)
        .foregroundStyle(Color.white)
        .padding(.leading, 13)
        .padding(.trailing, 20)
        .padding(.bottom, 12)
    }
}

#Preview {
    AdditionalInfoView()
}
