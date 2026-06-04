//
//  SaveProfileSubscriptions.swift
//  Aura
//
//  Created by Rafael Agayev on 04.06.26.
//

import SwiftUI

struct SaveProfileSubscriptions: View {
    
    @Environment(\.colorScheme) private var colorScheme
    
    private var verifiedBadge: some View{
        SaveProfileItemView(image: colorScheme == .dark ? .iconCheckmarkColored : .checkmark, title: "Verified badge")
    }
    
    private var increasedAccount: some View{
        SaveProfileItemView(image: colorScheme == .dark ? .iconCheckmarkColored : .checkmark, title: "Increased account protection")
    }
    
    private var enhancedSupport: some View{
        SaveProfileItemView(image: colorScheme == .dark ? .iconCheckmarkColored : .checkmark, title: "Enhanced support")
    }
    
    private var upgradedProfileLinks: some View{
        SaveProfileItemView(image: colorScheme == .dark ? .iconCheckmarkColored : .checkmark, title: "Upgraded profile links")
    }
    
    private var searchOptimization: some View{
        SaveProfileItemView(image: colorScheme == .dark ? .iconCheckmarkColored : .checkmark, title: "Search optimization")
    }
    
    private var uniqueStickers: some View{
        SaveProfileItemView(image: colorScheme == .dark ? .iconCheckmarkColored : .checkmark, title: "Unique stickers")
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 4){
            verifiedBadge
            
            increasedAccount
            
            enhancedSupport
            
            upgradedProfileLinks
            
            searchOptimization
            
            uniqueStickers
        }
       
    }
}

#Preview {
    SaveProfileSubscriptions()
}
