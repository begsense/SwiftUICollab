//
//  DarkCloudyView.swift
//  SwiftUICollab
//
//  Created by M1 on 14.06.2024.
//

import SwiftUI

struct DarkCloudyView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("warmTop"), Color("warmBottom")]),
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
                .scaledToFit()
                .foregroundStyle(Color.white)
                .position(x: 100, y: 150)
        }
    }
}
