//
//  MetaPaySubscriptionsViewModel.swift
//  Aura
//
//  Created by Rafael Agayev on 12.05.26.
//

import Foundation
import SwiftUI

class MetaPaySubscriptionsViewModel: BaseViewModel{
    
    let model: [MetaPaySubscriptionsModel] = [
        .init(image: .metaVerified, title: "Meta Verified", subtitle: "Build trust with your audience"),
        .init(image: .creators, title: "Creators", subtitle: "Support your favorite creators")
    ]
}
