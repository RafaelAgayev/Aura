//
//  MetaPaySubscriptionsModel.swift
//  Aura
//
//  Created by Rafael Agayev on 12.05.26.
//

import Foundation
import SwiftUI


struct MetaPaySubscriptionsModel: Identifiable{
    
    var id = UUID()
    let image: ImageResource
    let title: String
    let subtitle: String
}
