//
//  DarkSnowyView.swift
//  SwiftUICollab
//
//  Created by Elene Donadze on 6/13/24.
//

import SwiftUI
import SpriteKit

struct DarkSnowyView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("snowyNigthTop"), Color("snowyNightBottom")]),
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
                .foregroundStyle(Color.white)
                .frame(width: 138, height: 138)
                .scaledToFit()
                .position(x: 100, y: 150)
            
            SpriteView(scene: SnowFall2(), options: [.allowsTransparency])
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(.all)
                .foregroundStyle(Color.white)
        }
    }
}


