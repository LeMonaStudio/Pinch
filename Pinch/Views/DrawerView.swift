//
//  DrawerView.swift
//  Pinch
//
//  Created by Musa Lawrence on 5/29/23.
//

import SwiftUI

struct DrawerView: View {
    var isAnimating: Bool
    var pages: [Page]
    var onThumbnailTapped: (_ pageID: Int) -> Void
    
    @State private var isDrawerOpen: Bool = false
    
    
    var body: some View {
        HStack(spacing: 12) {
            //MARK: - DRAWER HANDLE
            Image(systemName: isDrawerOpen ? "chevron.compact.right" : "chevron.compact.left")
                .resizable()
                .scaledToFit()
                .frame(height: 60)
                .padding(8)
                .foregroundStyle(.secondary)
                .onTapGesture {
                    withAnimation(.easeOut){
                        isDrawerOpen.toggle()
                    }
                }
            
            //MARK: - THUMBNAILS
            ForEach(pages) { page in
                Image(page.thumbnailName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80)
                    .cornerRadius(8)
                    .shadow(radius: 4)
                    .opacity(isDrawerOpen ? 1 : 0)
                    .animation(.easeOut(duration: 0.5), value: isDrawerOpen)
                    .onTapGesture {
                        onThumbnailTapped(page.id)
                    }
            }
            
            Spacer()
            
        } //MARK: - DRAWER END
        .padding(EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8))
        .background(.ultraThinMaterial)
        .cornerRadius(12)
        .opacity(isAnimating ? 1 : 0)
        .frame(width: 260)
        .offset(x: isDrawerOpen ? 20 : 215)
    }
}

struct DrawerView_Previews: PreviewProvider {
    static var previews: some View {
        let pages: [Page] = pageData
        
        DrawerView(isAnimating: true, pages: pages, onThumbnailTapped: { pageID in })
            .preferredColorScheme(.light)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
