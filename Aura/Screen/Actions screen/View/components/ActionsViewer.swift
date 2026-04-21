//
//  ActionsViewer.swift
//  Aura
//
//  Created by Rafael Agayev on 05.01.26.
//

import SwiftUI

struct ActionsViewer: View {
    let icon: String
    
    let title: LocalizedStringResource
    
    var body: some View {
        HStack{
            Image(systemName: icon)
                .fontModifier(size: 15, weight: .medium, foregroundColor: .primary)
            
            Text(title)
                .fontModifier(size: 15, weight: .medium, foregroundColor: .primary)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .fontModifier(size: 14, weight: .medium, foregroundColor: .secondary)
        }
        .contentShape(Rectangle())
    }
}


