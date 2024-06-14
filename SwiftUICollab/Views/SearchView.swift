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
    @State private var showAlert = false
    @State private var showCityAlreadyAddedAlert = false
    @State private var showTbilisiAlert = false

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
                    .padding(.leading, 16)
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
                                    if let index = savedCities.firstIndex(where: { $0.name == city.name }) {
                                        showCityAlreadyAddedAlert = true
                                    } else {
                                        Context.insert(city)
                                        selectedCity = city.name ?? ""
                                        presentationMode.wrappedValue.dismiss()
                                    }

                                }, label: {
                                    Text(city.name ?? "")
                                        .foregroundStyle(Color.black)
                                        .fontWeight(.medium)
                                })
                                .padding(.bottom, 19)
                            }
                            .padding(.leading, 15)
                        }
                    }
                }
                .padding(.top, 26)
                Spacer()
                    .background(Color.searchBackground)
            }
            .navigationTitle("Locations")
            .background(Color.searchBackground)
        }
        .background(Color.searchBackground)
        .alert(isPresented: $showCityAlreadyAddedAlert) {
            Alert(
                title: Text("ქალაქი უკვე დამატებულია"),
                dismissButton: .default(Text("okydoky"))
            )
        }
    }

    private var favoritesCell: some View {
        return ForEach(savedCities, id: \.self) { city in
            HStack {
                VStack(alignment: .leading) {
                    Text(city.name ?? "")
                        .font(.custom("SF Pro Display", size: 25))

                    Spacer()
                        .frame(height: 12)

                    Text("\(viewModel.forecasts[city.name ?? ""]?.current.weather.first?.main ?? "")")
                        .font(.custom("SF Pro Display", size: 10))
                }
                .padding(.leading, 15)
                .padding(.top, 11)
                .padding(.bottom, 11)

                Spacer()
                Text("\(Int(viewModel.forecasts[city.name ?? ""]?.current.temp ?? 00))°")
                    .font(.custom("SF Pro Display", size: 53))
                    .padding(.trailing, 10)
            }
            .foregroundStyle(Color.white)
            .onAppear { viewModel.getWeatherForecast(for: city.name ?? "")
            }
            .background(LinearGradient(colors: [Color(red: 46 / 255, green: 176 / 255, blue: 221 / 255, opacity: 1), Color(red: 142 / 255, green: 173 / 255, blue: 225 / 255, opacity: 1)], startPoint: .top, endPoint: .bottom))
            .cornerRadius(16)
            .padding([.leading, .trailing], 20)
            .onTapGesture {
                selectedCity = city.name ?? ""
                presentationMode.wrappedValue.dismiss()
            }
            .onLongPressGesture {
                if city.name != "Tbilisi" {
                    deleteCity(city)
                }
            }
        }
    }

    private func deleteCity(_ city: City) {
        if let index = savedCities.firstIndex(of: city) {
            Context.delete(savedCities[index])
        }
    }
}
