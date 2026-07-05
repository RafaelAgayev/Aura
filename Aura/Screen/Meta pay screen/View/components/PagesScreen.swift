//
//  PagesScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 28.04.26.
//

import SwiftUI

struct PagesScreen: View {
    
    let icon: ImageResource
    
    let name: String
    
    @Environment(\.colorScheme) private var colorScheme
    
    var onTap: (MetaPayScreen.Navigation) -> Void
    
    var navigation: MetaPayScreen.Navigation? = nil
    
    var body: some View {
        
        HStack(spacing: 8) {
            Image(icon)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
            
            Text(name)
                .fontModifier(size: 14, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack )
            
            Spacer()
            
            Image(colorScheme == .dark ? .iconRightGray : .iconRightBlack)
                .resizable()
                .scaledToFit()
                .frame(width: 14, height: 14)
            
        }
        .contentShape(Rectangle())
        .onTapGesture {
            onTap(navigation ?? .adPreferences)
        }
        .padding(.vertical, 6)
        .padding(.horizontal, 2)
    }
}
