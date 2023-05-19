//
//  InfoPanelView.swift
//  Pinch
//
//  Created by Musa Lawrence on 5/19/23.
//

import SwiftUI


struct InfoPanelView: View {
    
    //MARK: - PROPERTY
    var scale: CGFloat
    var offset: CGSize
    @State private var isInfoPanelVisible: Bool = false
    
    
    var body: some View {
        HStack() {
            //MARK: - HOTSPOT
            Image(systemName: "circle.circle")
                .symbolRenderingMode(.hierarchical)
                .font(.system(size: 42, weight: .medium))
                .onLongPressGesture(minimumDuration: 1, perform: {
                    withAnimation(.easeOut){
                        isInfoPanelVisible.toggle()
                    }
                })
            
            Spacer()
            
            //MARK: - INFO PANEL
            HStack(spacing: 2) {
                Image(systemName: "arrow.up.left.and.arrow.down.right")
                Text("\(scale)")
                
                Spacer()
                
                Image(systemName: "arrow.left.and.right")
                Text("\(offset.width)")
                
                Spacer()
                
                Image(systemName: "arrow.up.and.down")
                Text("\(offset.height)")
                
                Spacer()
            }
            .font(.footnote)
            .padding(8)
            .background(.ultraThinMaterial)
            .cornerRadius(8)
            .frame(maxWidth: 420)
            .opacity(isInfoPanelVisible ? 1 : 0)
            
            Spacer()
            
        }
        
    }
}


struct InfoPanelView_Previews: PreviewProvider {
    static var previews: some View {
        InfoPanelView(scale: 1, offset: .zero)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
