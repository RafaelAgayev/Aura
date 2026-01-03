//
//  DetailsScreenSection.swift
//  Aura
//
//  Created by Rafael Agayev on 03.01.26.
//

import SwiftUI

struct DetailsScreenSection: View {
    
    var title: String?
    
    var subtitle: String?
    
    var date: Date?
    
    var body: some View {
        
        Text(title ?? "no title")
            .fontModifier(size: 20, weight: .semibold, foregroundColor: .colorBlack)
        
        Text(subtitle ?? "no subtitle")
            .fontModifier(size: 15, weight: .medium, foregroundColor: .colorBlack.opacity(0.75))
        
        if let date = date{
            Text(date.formatted(date: .abbreviated, time: .shortened))
                .fontModifier(size: 12, weight: .medium, foregroundColor: .colorBlack.opacity(0.70))
        }
    }
}

