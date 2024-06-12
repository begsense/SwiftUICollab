//
//  Glassmorphism.swift
//  Weather
//
//  Created by Luka  Kharatishvili on 12.06.24.
//

import SwiftUI


struct BlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style
    var cornerRadius: CGFloat

    func makeUIView(context: Context) -> UIVisualEffectView {
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.clipsToBounds = true
        blurView.layer.cornerRadius = cornerRadius
        return blurView
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
        uiView.layer.cornerRadius = cornerRadius
    }
}

struct Glassmorphism: ViewModifier {
    var blurStyle: UIBlurEffect.Style?
    var backgroundColor: Color
    var cornerRadius: CGFloat
    var blurOpacity: Double
    
    func body(content: Content) -> some View {
        ZStack {
            if let blurStyle = blurStyle {
                BlurView(style: blurStyle, cornerRadius: cornerRadius)
                    .opacity(blurOpacity)
            }
            
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(backgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            
            content
                .cornerRadius(cornerRadius)
        }
    }
}

extension View {
    func glassmorphism(blurStyle: UIBlurEffect.Style? = nil, backgroundColor: Color, cornerRadius: CGFloat, blurOpacity: Double) -> some View {
        modifier(Glassmorphism(blurStyle: blurStyle, backgroundColor: backgroundColor, cornerRadius: cornerRadius, blurOpacity: blurOpacity))
    }
}
