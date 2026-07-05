//
//  ActionsViewerOrders.swift
//  Aura
//
//  Created by Rafael Agayev on 26.04.26.
//

import SwiftUI

struct ActionsViewerOrders: View {
    
    let image: ImageResource
    
    let text: String
    
    @Environment(\.colorScheme)  private var colorScheme
    
    var onTap: () -> Void
    
    var body: some View {
        
        HStack(spacing: 8) {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
            
            Text(text)
                .fontModifier(size: 14, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .fontModifier(size: 14, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
        }
        .padding(.horizontal, 8)
        .contentShape(Rectangle())
        .onTapGesture {
            onTap()
        }
    }
}
