//
//  InstagramCreatorsModel.swift
//  Aura
//
//  Created by Rafael Agayev on 12.05.26.
//

import Foundation
import SwiftUI

struct InstagramCreatorsModel: Identifiable{
    var id = UUID()
    
    let image: ImageResource
    let name: String
    let follower: String

    let userName: String
    let posts: Double
    let following: String
}
