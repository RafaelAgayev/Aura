//
//  FullScreenComponents.swift
//  Aura
//
//  Created by Rafael Agayev on 20.01.26.
//

import Foundation
import SwiftUI


enum FullScreenComponents: Identifiable{
    
    case book(ImageResource)
    case travel(ImageResource)
    case music(ImageResource)
    
    var id: ImageResource{
        switch self {
        case .book(let img):
           return img
        case .travel(let img):
            return img
        case .music(let img):
            return img
        }
    }
}
