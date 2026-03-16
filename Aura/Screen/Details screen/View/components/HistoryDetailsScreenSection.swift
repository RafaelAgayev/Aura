//
//  HistoryDetailsScreenSection.swift
//  Aura
//
//  Created by Rafael Agayev on 03.01.26.
//

import SwiftUI

struct HistoryDetailsScreenSection: View {
    
    var title: String?
    
    var subtitle: String?
    
    var date: Date?
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 6){
            
            if let title = title{
                Text(title)
                    .fontModifier(size: 20, weight: .semibold, foregroundColor: .colorBlack)
                
            }
            
            if let subtitle = subtitle {
                Text(subtitle)
                    .fontModifier(size: 15, weight: .medium, foregroundColor: .colorBlack.opacity(0.75))
                
            }
            
            if let date = date{
                Text(date.formatted(date: .abbreviated, time: .shortened))
                    .fontModifier(size: 12, weight: .medium, foregroundColor: .colorBlack.opacity(0.70))
            }
        }
    }
}

