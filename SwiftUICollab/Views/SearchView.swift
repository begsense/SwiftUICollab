//
//  SearchBarView.swift
//  Assignment34th
//
//  Created by Luka  Kharatishvili on 05.06.24.
//

import SwiftData
import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    @StateObject var viewModel = SearchViewModel()
    @Query var savedCities: [City]
    @Environment(\.modelContext) var Context
    @Environment(\.presentationMode) var presentationMode
    @Binding var selectedCity: String

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .padding([.top, .bottom], 10)
                            .padding(.leading, 8)

                        TextField("Enter a city name", text: $searchText)
                            .autocorrectionDisabled()
                            .padding(.vertical, 10)
                            .padding(.trailing, 8)
                    }
                    .onChange(of: searchText) { _, _ in
                        viewModel.getCities(withName: searchText)
                    }
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.trailing, searchText.isEmpty ? 20 : 14)

                    if !searchText.isEmpty {
                        Button(action: {
                            withAnimation {
                                searchText = ""
                            }
                        }, label: {
                            Text("Cancel")
                                .foregroundColor(Color.blue)
                                .padding(.trailing, 16)
                        })
                    }
                }
                .animation(.default, value: searchText)

                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(viewModel.cities, id: \.self) { city in
                            Button(action: {
                                if let index = savedCities.firstIndex(where: { $0.id == city.id }) {
                                } else {
                                    Context.insert(city)
                                }
                                selectedCity = city.name ?? ""
                                presentationMode.wrappedValue.dismiss()

                            }, label: {
                                Text(city.name ?? "")
                                    .foregroundStyle(Color.black)
                            })
                            .padding(.bottom, 19)
                        }
                    }
                }
                .padding(.top, 26)
                Spacer()
                    .background(Color.searchBackground)
            }
            .padding(.leading, 20)
            .navigationTitle("Locations")
            .background(Color.searchBackground)
        }
        .background(Color.searchBackground)
    }
}
