//
//  WarmNight.swift
//  SwiftUICollab
//
//  Created by M1 on 14.06.2024.
//

import SwiftUI

struct WarmNight: View {
    let stars = [
        Star(image: "Star", width: 15, height: 15, x: 20, y: 50),
        Star(image: "Star", width: 120, height: 120, x: 280, y: 30),
        Star(image: "Star", width: 70, height: 70, x: 150, y: 100),
        Star(image: "Star", width: 40, height: 40, x: 50, y: 150),
        Star(image: "Star", width: 15, height: 15, x: 250, y: 50),
        Star(image: "Star", width: 25, height: 25, x: 80, y: 220),
        Star(image: "Star", width: 55, height: 55, x: 320, y: 150),
        Star(image: "Star", width: 99, height: 99, x: 200, y: 80),
        Star(image: "Star", width: 8, height: 8, x: 180, y: 250),
        Star(image: "Star", width: 15, height: 15, x: 300, y: 220),
        Star(image: "Star", width: 25, height: 25, x: 100, y: 300),
        Star(image: "Star", width: 55, height: 55, x: 40, y: 350),
        Star(image: "Star", width: 99, height: 99, x: 150, y: 350),
        Star(image: "Star", width: 10, height: 10, x: 280, y: 320),
        Star(image: "Star", width: 10, height: 10, x: 100, y: 400)
    ]
    
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




#Preview {
    WarmNight()
}
