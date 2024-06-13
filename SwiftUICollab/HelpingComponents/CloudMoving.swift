//
//  CloudMoving.swift
//  SwiftUICollab
//
//  Created by M1 on 14.06.2024.
//

import SwiftUI
import SpriteKit

struct Cloudy: View {
    var body: some View {
        SpriteView(scene: Clouds(), options: [.allowsTransparency])
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea(.all)
    }
}

class Clouds: SKScene {
    override func sceneDidLoad() {
        size = UIScreen.main.bounds.size
        scaleMode = .resizeFill
        anchorPoint = CGPoint(x: 0.5, y: 1)
        backgroundColor = .clear
        if let node = SKEmitterNode(fileNamed: "Clouds.sks") {
            addChild(node)
            node.particlePositionRange.dx = UIScreen.main.bounds.width
        }
    }
}
