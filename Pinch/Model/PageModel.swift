//
//  PageModel.swift
//  Pinch
//
//  Created by Musa Lawrence on 5/29/23.
//

import Foundation


struct Page: Identifiable {
    let id: Int
    let imageName: String
}


extension Page {
    var thumbnailName: String {
        return "thumb-" + imageName
    }
}
