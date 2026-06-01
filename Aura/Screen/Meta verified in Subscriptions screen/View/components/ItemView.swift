//
//  ItemView.swift
//  Aura
//
//  Created by Rafael Agayev on 26.05.26.
//

import SwiftUI

struct ItemView: View {
    
    let icon: ImageResource
    
    let title: String
    
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        HStack(spacing: 8) {
            Image(icon)
                .resizable()
                .scaledToFill()
                .frame(width: 16, height: 16)
            
            Text(title)
                .fontModifier(size: 16, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
        }
    }
}


