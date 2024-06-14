////
////  FavoriteCityCell.swift
////  SwiftUICollab
////
////  Created by Luka  Kharatishvili on 14.06.24.
////
//
//import SwiftUI
//
//struct FavoriteCityCell: View {
//    let city: City
//    @Binding var selectedCity: String
//    @Binding var showAlert: Bool
//    @Environment(\.presentationMode) var presentationMode
//    @StateObject var viewModel = SearchViewModel()
//
//    var body: some View {
//        HStack {
//            VStack(alignment: .leading) {
//                Text(city.name ?? "")
//                    .font(.custom("SF Pro Display", size: 25))
//                
//                Spacer()
//                    .frame(height: 12)
//                
//                Text("\(viewModel.forecasts[city.name ?? ""]?.current.weather.first?.main ?? "")")
//                    .font(.custom("SF Pro Display", size: 10))
//            }
//            .padding(.leading, 15)
//            .padding(.top, 11)
//            .padding(.bottom, 11)
//            
//            Spacer()
//            Text("\(Int(viewModel.forecasts[city.name ?? ""]?.current.temp ?? 00))°")
//                .font(.custom("SF Pro Display", size: 53))
//                .padding(.trailing, 10)
//        }
//        .foregroundColor(Color.white)
//        .onAppear {
//            viewModel.getWeatherForecast(for: city.name ?? "")
//        }
//        .background(LinearGradient(colors: [Color(red: 46 / 255, green: 176 / 255, blue: 221 / 255, opacity: 1), Color(red: 142 / 255, green: 173 / 255, blue: 225 / 255, opacity: 1)], startPoint: .top, endPoint: .bottom))
//        .cornerRadius(16)
//        .padding([.leading, .trailing], 20)
//        .onTapGesture {
//            selectedCity = city.name ?? ""
//            presentationMode.wrappedValue.dismiss()
//        }
//        .onLongPressGesture {
//            if city.name != "Tbilisi" {
//                showAlert = true
//            } else {
//                showAlert = true
//            }
//        }
//        .alert(isPresented: $showAlert) {
//            Alert(
//                title: Text("თქვენი ქმედება სცდება აპლიკაციის ფუნქციონალს"),
//                message: Text("თბილისს ვერ წაშლი."),
//                dismissButton: .default(Text("მომიტევეთ"))
//            )
//        }
//    }
//}
//
