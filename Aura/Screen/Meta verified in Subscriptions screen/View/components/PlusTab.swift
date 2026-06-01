//
//  PlusTab.swift
//  Aura
//
//  Created by Rafael Agayev on 26.05.26.
//

import SwiftUI

struct PlusTab: View {
    
    @Environment(\.colorScheme) private var colorScheme
    
    var onTap: () -> Void
    
    private var header: some View{
        Text("Plus")
            .fontModifier(size: 18, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
    }
    
    private var tutorials: some View{
        VStack(alignment: .leading, spacing: 8){
            HStack(spacing: 1) {
                Text("$1.49 for your first month")
                    .fontModifier(size: 14, weight: .medium, foregroundColor: .colorGreen)
                
                Text("$21.90/month per profile")
                    .strikethrough(true)
                    .fontModifier(size: 14, weight: .medium, foregroundColor: .colorGray)
            }
            
            HStack(spacing: 2) {
                Image(.info)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 14, height: 14)
                
                Text("Trial benefit")
                    .fontModifier(size: 16, weight: .medium, foregroundColor: .colorGray)
                
                if let url = URL(string: "https://www.instagram.com"){
                    Link("Learn more", destination: url)
                        .fontModifier(size: 16, weight: .medium, foregroundColor: .backgroundBlue)
                }
            }
        }
    }
    
    private var verifiedBadge: some View{
        ItemView(icon: .iconMetaVerifiedWhite, title: "Verified badge")
    }
    
    private var maximizeDiscovery: some View{
        Text("Maximize discovery")
            .fontModifier(size: 18, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
    }
    
    private var searchOptimization: some View{
        ItemView(icon: colorScheme == .dark ? .iconCheckmarkColored : .checkmark, title: "Search Optimization")
    }
    
    private var featuredProfile: some View{
        ItemView(icon: colorScheme == .dark ? .iconCheckmarkColored : .checkmark, title: "Featured profile")
    }
    
    private var addToLinksReels: some View{
        HStack(spacing: 8) {
            Image( colorScheme == .dark ? .iconCheckmarkColored : .checkmark)
                .resizable()
                .scaledToFill()
                .frame(width: 14, height: 14)
            
            VStack(alignment: .leading, spacing: 4){
                Text("Add links to Reels")
                    .fontModifier(size: 16, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
                
                Text("2 per month")
                    .fontModifier(size: 13, weight: .medium, foregroundColor: .colorGreen)
            }
        }
    }
    
    private var driveEngagement: some View{
        Text("Drive engagement")
            .fontModifier(size: 18, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
    }
    
    private var upgradeLinks: some View{
        ItemView(icon: colorScheme == .dark ? .iconCheckmarkColored : .checkmark, title: "Upgraded profile links")
    }
    
    private var exclusiveStickers: some View{
        ItemView(icon: colorScheme == .dark ? .iconCheckmarkColored : .checkmark, title: "Exclusive stickers")
    }
    

    private var competitiveInsights: some View{
        ItemView(icon: colorScheme == .dark ? .iconCheckmarkColored : .checkmark, title: "Competitive insights")
    }
    
    private var protectBrand: some View{
        Text("Protect your brand")
            .fontModifier(size: 18, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
    }
    
    private var enhancedSupport: some View{
        HStack(spacing: 8) {
            Image(colorScheme == .dark ? .iconCheckmarkColored : .checkmark)
                .resizable()
                .scaledToFill()
                .frame(width: 14, height: 14)
            
            VStack(alignment: .leading, spacing: 4){
                Text("Enhanced support")
                    .fontModifier(size: 14, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
                
                Text("Chat or email with agents Get issues resolved more quickly")
                    .fontModifier(size: 13, weight: .medium, foregroundColor: .colorGreen)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
        }
    }
    
    private var customChatThemes: some View{
        ItemView(icon: colorScheme == .dark ? .iconXMarkColored : .iconXMark, title: "Custom chat themes")
    }
    
    private var seeBenefitDetails: some View{
        Button{
            withAnimation{
                onTap()
            }
        }label: {
            Text("See benefit details")
        }
        .padding(.horizontal, 16)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            header
            
            tutorials
            
            Divider()
                .padding(.horizontal, -8)
            
            verifiedBadge
            
            searchOptimization
            
            featuredProfile
            
            addToLinksReels
            
            driveEngagement
            
            upgradeLinks
            
            exclusiveStickers
            
            competitiveInsights
            
            enhancedSupport
            
            customChatThemes
            
            seeBenefitDetails
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .roundedRectangleStyle(cornerRadius: 12, backgroundColor: colorScheme == .dark ? .colorBlack.opacity(0.1) : .colorWhite.opacity(0.1), borderColor: .colorGray, borderWidth: 1.55)
    }
}
