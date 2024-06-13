//
//  BirdView.swift
//  SwiftUICollab
//
//  Created by Elene Donadze on 6/12/24.
//

import SwiftUI

struct BirdView: View {
    @State private var bird1Position = UIScreen.main.bounds.width
    @State private var bird2Position = UIScreen.main.bounds.width + 25
    @State private var bird3Position = UIScreen.main.bounds.width + 30


    
    var body: some View {
        ZStack {
            birds
            .edgesIgnoringSafeArea(.all)
        }
    }
    
    func moveBird1() {
        withAnimation(Animation.linear(duration: 5).repeatForever(autoreverses: false)) {
            bird1Position = -50
        }
    }
    
    func moveBird2() {
        withAnimation(Animation.linear(duration: 5).repeatForever(autoreverses: false)) {
            bird2Position = -50
        }
    }
    
    func moveBird3() {
        withAnimation(Animation.linear(duration: 5).repeatForever(autoreverses: false)) {
            bird3Position = -50
        }
        
    }
    
    private var birds: some View {
        ZStack {
            
            Image("Sun")
                .resizable()
                .frame(width: 138, height: 138)
                .scaledToFit()
                .position(x: 100, y: 150)
            
            Image(.bird)
                .resizable()
                .foregroundStyle(Color.red)
                .frame(width: 30, height: 30)
                .position(x: bird1Position, y: 100)
                .onAppear {
                    moveBird1()
                }
            
            Image(.bird)
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundStyle(Color.blue)
                .position(x: bird2Position, y: 200)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        moveBird2()
                    }
                }
            
            Image(.bird)
                .resizable()
                .foregroundStyle(Color.red)
                .frame(width: 60, height: 60)
                .position(x: bird3Position, y: 300)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        moveBird3()
                    }
                }
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [Color("sunnyTop"), Color("sunnyBottom")]),
                           startPoint: .top,
                           endPoint: .bottom)
        )
    }
    
        
}



#Preview {
    BirdView()
}
