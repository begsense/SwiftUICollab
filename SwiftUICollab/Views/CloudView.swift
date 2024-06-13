//
//  CloudView.swift
//  SwiftUICollab
//
//  Created by M1 on 14.06.2024.
//

import SwiftUI

struct CloudView: View {
    @State private var cloud1Position = UIScreen.main.bounds.width - 50
    @State private var cloud2Position = UIScreen.main.bounds.width - 200
    @State private var cloud3Position = UIScreen.main.bounds.width + 20
    
    var body: some View {
        ZStack {
            clouds
        }
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color("cloudyFirst"), Color("cloudySecond")]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)
        )
    }
    
    func moveCloud1() {
        withAnimation(Animation.linear(duration: 30).repeatForever(autoreverses: false)) {
            cloud1Position = -150
        }
    }
    
    func moveCloud2() {
        withAnimation(Animation.linear(duration: 35).repeatForever(autoreverses: false)) {
            cloud2Position = -150
        }
    }
    
    func moveCloud3() {
        withAnimation(Animation.linear(duration: 40).repeatForever(autoreverses: false)) {
            cloud3Position = -150
        }
    }
    
    private var clouds: some View {
        ZStack {
            Image("Sun")
                .resizable()
                .frame(width: 138, height: 138)
                .scaledToFit()
                .position(x: 100, y: 150)
            ZStack {
                
                
                
                Image(.cloud)
                    .resizable()
                    .frame(width: 150, height: 100)
                    .position(x: cloud1Position, y: 100)
                    .onAppear {
                        moveCloud1()
                    }
                
                Image(.cloud2)
                    .resizable()
                    .frame(width: 200, height: 130)
                    .position(x: cloud2Position, y: 200)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                            moveCloud2()
                        }
                    }
                
                Image(.cloud)
                    .resizable()
                    .frame(width: 180, height: 120)
                    .position(x: cloud3Position, y: 300)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                            moveCloud3()
                            
                        }
                        
                    }
                
            }
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    CloudView()
}
