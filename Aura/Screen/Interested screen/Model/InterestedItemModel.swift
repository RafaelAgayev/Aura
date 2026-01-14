//
//  InterestedItemModel.swift
//  Aura
//
//  Created by Rafael Agayev on 13.01.26.
//

import Foundation

struct InterestedItemModel: Hashable{
    let id = UUID()
    let title: String
    let description: String
    let systemImage: String?
    let type: InterestedScreen.Item
}
