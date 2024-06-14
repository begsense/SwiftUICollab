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
//    @Published var forecasts: [String: Forecast] = [:]

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
                    if searchText.isEmpty {
                        favoritesCell
                    } else {
                        VStack(alignment: .leading) {
                            ForEach(viewModel.cities, id: \.self) { city in

                                Button(action: {
                                    if let _ = savedCities.firstIndex(where: { $0.id == city.id }) {
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
        .onAppear {
        }
    }

    private var favoritesCell: some View {
        ForEach(savedCities, id: \.self) { city in
            HStack {
                VStack(alignment: .leading) {
                    Text(city.name ?? "")
                        .font(.custom("SF Pro Display", size: 25))

                    Spacer()
                        .frame(height: 12)

                    Text("\(viewModel.forecasts[city.name ?? ""]?.current.weather.first?.main ?? "")")
                        .font(.custom("SF Pro Display", size: 10))
                }

                Spacer()
                Text("\(Int(viewModel.forecasts[city.name ?? ""]?.current.temp ?? 00))°")
                    .font(.custom("SF Pro Display", size: 53))
            }
            .foregroundStyle(Color.white)
            .onAppear { viewModel.getWeatherForecast(for: city.name ?? "")
            }
            .padding(13)
            .background(LinearGradient(colors: [Color(red: 46 / 255, green: 176 / 255, blue: 221 / 255, opacity: 1), Color(red: 142 / 255, green: 173 / 255, blue: 225 / 255, opacity: 1)], startPoint: .top, endPoint: .bottom))
            .cornerRadius(16)
            .padding(20)
        }
    }
}
