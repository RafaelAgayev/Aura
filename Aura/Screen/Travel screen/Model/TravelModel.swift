//
//  TravelModel.swift
//  Aura
//
//  Created by Rafael Agayev on 15.01.26.
//

import Foundation
import SwiftUI

struct TravelModel: Identifiable, Hashable{
    
    let id: UUID
    let title: String
    let description: String
    let image: ImageResource?
    let rank: Int
    let liked: Double
    let location: String
    
}
