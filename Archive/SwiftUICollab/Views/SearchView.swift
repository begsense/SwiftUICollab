//
//  SearchView.swift
//  SwiftUICollab
//
//  Created by M1 on 12.06.2024.
//

import SwiftUI

struct SearchView: View {
    @State var testValue: String = ""
    @State var testArray: [String] = [""]
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("    Search", text: $testValue)
                    .navigationTitle("Locations")
                    .padding(10)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .frame(width: 343, height: 36)
                    .overlay(alignment: .leading) {
                        Image(systemName: "magnifyingglass")
                            .padding(.leading, 5)
                            .foregroundColor(.gray)
                    }
                
                ScrollView {
                    ForEach(0..<testArray.count, id: \.self) { weather in
                        SearchCell(cityName: "Tbilisi", weatherCase: "Rainy", celsius: "23*")
                        }
                    }
                
                Spacer()
            }
            .padding(.top, 15)
            .foregroundColor(.primary)
        }
        .navigationTitle("Locations")
    }
    
}

#Preview {
    SearchView()
}
