//
//  ContentView.swift
//  ChallengeFive
//
//  Created by Ivan Pryhara on 13/03/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var offset = CGPoint(x: 0, y: 0)
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                VStack(spacing: 0) {
                    colorBackground(.white, height: proxy.size.height / 4)
                    colorBackground(.pink, height: proxy.size.height / 4)
                    colorBackground(.yellow, height: proxy.size.height / 4)
                    colorBackground(.black, height: proxy.size.height / 4)
                }
                
                ZStack {
                    rectangle
                        .foregroundColor(.white)
                        .blendMode(.difference)
                        .overlay(rectangle.blendMode(.hue))
                        .overlay(rectangle.foregroundColor(.white).blendMode(.overlay))
                        .overlay(rectangle.foregroundColor(.black).blendMode(.overlay))
                }
                .position(x: offset.x, y: offset.y)
                .gesture(
                    DragGesture()
                        .onChanged({ gesture in
                            offset = gesture.location
                        })
                        .onEnded({ gesture in
                            offset = gesture.location
                        })
                )
            }
            .onAppear {
                offset = CGPoint(x: proxy.frame(in: .global).midX, y: proxy.frame(in: .global).midY)
            }
        }
        .ignoresSafeArea()
    }
    
    private func colorBackground(_ color: Color, height: CGFloat) -> some View {
        Rectangle()
            .frame(height: height)
            .foregroundColor(color)
    }
    
    private var rectangle: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: 100, height: 100)
    }
}

#Preview {
    ContentView()
}
