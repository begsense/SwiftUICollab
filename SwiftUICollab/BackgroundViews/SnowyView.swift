//
//  SnowyView.swift
//  SwiftUICollab
//
//  Created by M1 on 14.06.2024.
//

import SwiftUI
import SpriteKit

struct SnowyView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("snowTop"), Color("snowBottom")]),
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
            
            SpriteView(scene: SnowFall2(), options: [.allowsTransparency])
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(.all)
                .foregroundStyle(Color.white)
        }
    }
}

class SnowFall2: SKScene {
    override func sceneDidLoad() {
        size = UIScreen.main.bounds.size
        scaleMode = .resizeFill
        anchorPoint = CGPoint(x: 0.5, y: 1)
        backgroundColor = .clear
        let node = SKEmitterNode(fileNamed: "SnowFall2.sks")!
        addChild(node)
        node.particlePositionRange.dx = UIScreen.main.bounds.width
    }
}
