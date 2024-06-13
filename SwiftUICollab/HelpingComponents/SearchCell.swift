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
            
            Spacer()
            
            Text(celsius)
                .font(.custom("SF Pro Display", size: 53))
        }
        .padding(13)
        .background(LinearGradient(colors: [Color(red: 46/255, green: 176/255, blue: 221/255, opacity: 1), Color(red: 142/255, green: 173/255, blue: 225/255, opacity: 1)], startPoint: .bottom, endPoint: .top))
        .cornerRadius(16)
        .padding(20)
    }
}

#Preview {
    SearchCell()
}
