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
    @State private var imageOffset: CGSize = .zero
    
    //MARK: - FUNCTION
    func resetImageState() {
        imageScale = 1
        imageOffset = .zero
    }
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            ZStack {
                Color(.clear)
                
                //MARK: - PAGE IMAGE
                Image("magazine-front-cover")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
                    .opacity(isAnimating ? 1 : 0)
                    .offset(x: imageOffset.width, y: imageOffset.height)
                    .animation(.linear(duration: 1), value: isAnimating)
                    .scaleEffect(imageScale)
                    //MARK: - 1. TAP GESTURE
                    .onTapGesture(count: 2) {
                        if imageScale == 1 {
                            withAnimation(.spring()){
                                imageScale = 5
                            }
                        } else {
                            resetImageState()
                        }
                    }
                    //MARK: - 2. DRAG GESTURE
                    .gesture(
                        DragGesture()
                            .onChanged({ gesture in
                                withAnimation(.linear(duration: 1)){
                                    imageOffset = gesture.translation
                                }
                            })
                            .onEnded({ gesture in
                                if imageScale <= 1 {
                                    resetImageState()   
                                } else {
                                    imageOffset = gesture.translation
                                    imageScale = 5
                                }
                            })
                    )
                    //MARK: - MAGNIFICATION GESTURE
                    .gesture(
                        MagnificationGesture()
                            .onChanged({ gesture in
                                withAnimation(.spring()){
                                    if imageScale >= 1 && imageScale <= 10  {
                                        imageScale = gesture
                                    }
                                }
                            })
                            .onEnded({ _ in
                                withAnimation(.spring()){
                                    if imageScale <= 1 {
                                        resetImageState()
                                    }
                                    if imageScale > 10 {
                                        imageScale = 10
                                    }
                                }
                            })
                    )
                    
            } //: ZSTACK
            .navigationBarTitle("Pinch & Zoom", displayMode: .inline)
            .onAppear{
                isAnimating.toggle()
            }
            //MARK: - INFOPANEL
            .overlay(alignment: .topLeading) {
                InfoPanelView(scale: imageScale, offset: imageOffset)
                    .padding(.horizontal)
            }
            //MARK: - CONTROLS
            .overlay(alignment: .bottom) {
                Group {
                    HStack {
                        //SCALE DOWN
                        Button {
                            withAnimation(.spring()){
                                imageScale -= 1
                                if imageScale <= 1 {
                                    resetImageState()
                                }
                            }
                        } label: {
                            ControlImageView(systemImageName: "minus.magnifyingglass")
                        }

                        
                        // RESET
                        
                        Button {
                            withAnimation(.spring()){
                                resetImageState()
                            }
                        } label: {
                            ControlImageView(systemImageName: "arrow.up.left.and.down.right.magnifyingglass")
                        }
                        
                        //SCALE UP
                        
                        Button {
                            withAnimation(.spring()){
                                imageScale += 1
                                if imageScale > 10 {
                                    imageScale = 10
                                }
                            }
                        } label: {
                            ControlImageView(systemImageName: "plus.magnifyingglass")
                        }
                        
                    }//: CONTROLS
                }
                .padding(8)
                .background(.ultraThinMaterial)
                .cornerRadius(12)
                .opacity(isAnimating ? 1 : 0)
                .animation(.linear(duration: 1), value: isAnimating)
                
            }
        } //: NAVIGATION
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
