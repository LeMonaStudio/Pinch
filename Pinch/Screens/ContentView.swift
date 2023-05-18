//
//  ContentView.swift
//  Pinch
//
//  Created by Musa Lawrence on 5/18/23.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTY
    @State private var isAnimating: Bool = false
    @State private var imageScale: CGFloat = 1
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            ZStack {
                //MARK: - PAGE IMAGE
                Image("magazine-front-cover")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
                    .opacity(isAnimating ? 1 : 0)
                    .animation(.linear(duration: 1), value: isAnimating)
                    .scaleEffect(imageScale)
                    .onTapGesture(count: 2) {
                        if imageScale == 1 {
                            withAnimation(.spring()){
                                imageScale = 5
                            }
                        } else {
                            withAnimation(.easeOut(duration: 0.5)){
                                imageScale = 1
                            }
                        }
                    }
                    
                    
            } //: ZSTACK
            .navigationBarTitle("Pinch & Zoom", displayMode: .inline)
            .onAppear{
                isAnimating.toggle()
            }
        } //: NAVIGATION
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
