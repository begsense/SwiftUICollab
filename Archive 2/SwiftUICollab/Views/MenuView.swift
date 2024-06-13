//
//  MenuView.swift
//  Weather
//
//  Created by Luka  Kharatishvili on 12.06.24.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        var savedLocations = ["first", "second", "third"]
        return Menu {
            ForEach(savedLocations, id: \.self) { option in
                Button(action: {
                    // Your action here
                }) {
                    Label(option, systemImage: "checkmark")
                }
            }
            NavigationLink(destination: SearchView()) {
                Label("Add new location", systemImage: "location.fill")
            }
        } label: {
            HStack {
                Image("location")
                Text("Tbilisi")
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

#Preview {
    MenuView()
}
