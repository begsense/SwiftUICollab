//
//  DarkSunnyView.swift
//  SwiftUICollab
//
//  Created by M1 on 14.06.2024.
//

import SwiftUI

struct DarkSunnyView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("warmTop"), Color("warmBottom")]),
                           startPoint: .top,
                           endPoint: .bottom)
            .ignoresSafeArea(.all)
            
            ForEach(stars) { star in
                Image(star.image)
                    .resizable()
                    .frame(width: star.width, height: star.height)
                    .scaledToFit()
                    .foregroundStyle(Color.white)
                    .position(x: star.x, y: star.y)
            }
            
            Image("Moon")
                .resizable()
                .frame(width: 138, height: 138)
                .scaledToFit()
                .position(x: 100, y: 150)
        }
    }
}
