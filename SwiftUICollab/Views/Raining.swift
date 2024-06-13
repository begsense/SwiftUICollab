//
//  Raining.swift
//  SwiftUICollab
//
//  Created by M1 on 14.06.2024.
//

import SwiftUI
import SpriteKit


struct Raining: View {
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
            LinearGradient(gradient: Gradient(colors: [Color("rainyFirst"), Color("rainySecond")]),
                           startPoint: .top,
                           endPoint: .bottom)
            .ignoresSafeArea(.all)
            
            ForEach(clouds) { cloud in
                Image(cloud.image)
                    .resizable()
                    .frame(width: cloud.width, height: cloud.height)
                    .scaledToFit()
                    .foregroundStyle(Color.white)
                    .position(x: cloud.x, y: cloud.y)
            }
            
            Image("Sun")
                .resizable()
                .frame(width: 138, height: 138)
                .scaledToFit()
                .position(x: 100, y: 150)
            
            SpriteView(scene: RainFall(), options: [.allowsTransparency])
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(.all)
        }
    }
}


class RainFall: SKScene {
    override func sceneDidLoad() {
        
        size = UIScreen.main.bounds.size
        scaleMode = .resizeFill
        anchorPoint = CGPoint(x: 0.5, y: 1)
        backgroundColor = .clear
        let node = SKEmitterNode(fileNamed: "RainFall.sks")!
        addChild(node)
        node.particlePositionRange.dx = UIScreen.main.bounds.width
    }
    
}
//#Preview {
//    Raining()
//}
