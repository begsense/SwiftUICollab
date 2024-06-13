//
//  MenuView.swift
//  Weather
//
//  Created by Luka  Kharatishvili on 12.06.24.
//

import SwiftData
import SwiftUI

struct MenuView: View {
    @Binding var selectedCity: String
    @Query var savedCities: [City]
    @Environment(\.modelContext) var Context
    var body: some View {
        Menu {
            ForEach(savedCities, id: \.self) { option in
                Button(action: {
                    selectedCity = option.name ?? ""
                }) {
                    Label(option.name ?? "", systemImage: option.name == selectedCity ? "checkmark" : "")
                }
            }
            NavigationLink(destination: SearchView(selectedCity: $selectedCity)) {
                Label("Add new location", systemImage: "location.fill")
            }
        } label: {
            HStack {
                Image("location")
                Text(selectedCity)
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                Image("dropDown")
            }
            .padding([.trailing, .leading], 14)
            .padding(.trailing, 29)
            .padding([.top, .bottom], 5)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(UIColor(named: "color") ?? .clear))
                    .glassmorphism(blurStyle: .systemUltraThinMaterial, backgroundColor: Color(UIColor(named: "color") ?? .clear), cornerRadius: 20, blurOpacity: 0.4)
            )
        }
    }
}
