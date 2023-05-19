//
//  ControlImageView.swift
//  Pinch
//
//  Created by Musa Lawrence on 5/19/23.
//

import SwiftUI

struct ControlImageView: View {
    let systemImageName: String
    
    var body: some View {
        Image(systemName: systemImageName)
            .font(.system(size: 36))
    }
}

struct ControlImageView_Previews: PreviewProvider {
    static var previews: some View {
        ControlImageView(systemImageName: "minus.magnifyingglass")
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
