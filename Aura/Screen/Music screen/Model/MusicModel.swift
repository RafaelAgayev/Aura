//
//  MusicModel.swift
//  Aura
//
//  Created by Rafael Agayev on 20.01.26.
//

import Foundation
import SwiftUI

struct MusicModel: Identifiable, Hashable{
    
    let id: UUID
    var artist: String
    var songName: String
    var image: ImageResource?
    var description: String
    
}
