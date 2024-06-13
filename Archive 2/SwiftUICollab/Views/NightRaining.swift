//
//  NightRaining.swift
//  SwiftUICollab
//
//  Created by Elene Donadze on 6/13/24.
//

import SwiftUI
import SpriteKit


struct NightRaining: View {
    let clouds = [
        Cloud(image: "Cloud", width: 180, height: 100, x: 300, y: 100),
        Cloud(image: "Cloud2", width: 120, height: 80, x: 29, y: 5),
        Cloud(image: "Cloud", width: 50, height: 30, x: 54, y: 259),
        Cloud(image: "Cloud", width: 30, height: 10, x: 10, y: 400),
        Cloud(image: "Cloud2", width: 40, height: 23, x: 200, y: 200),
        Cloud(image: "Cloud", width: 80, height: 50, x: 54, y: 259),
        Cloud(image: "Cloud", width: 150, height: 50, x: 300, y: 100),
        Cloud(image: "Cloud", width: 80, height: 40, x: 35, y: 99),
        Cloud(image: "Cloud2", width: 100, height: 50, x: 200, y: 15)
    ]
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("nightRainTop"), Color("nightRainBottom")]),
                           startPoint: .top,
                           endPoint: .bottom)
                .ignoresSafeArea(.all)
            
            ForEach(clouds) { cloud in
                Image(cloud.image)
                    .resizable()
                    .frame(width: cloud.width, height: cloud.height)
                    .scaledToFit()
                    .foregroundStyle(Color.gray)
                    .position(x: cloud.x, y: cloud.y)
            }

            Image("Moon")
                .resizable()
                .frame(width: 138, height: 138)
                .foregroundStyle(Color.white)
                .scaledToFit()
                .position(x: 100, y: 150)
            
            SpriteView(scene: RainFall(), options: [.allowsTransparency])
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(.all)
        }
    }
}



#Preview {
    NightRaining()
}