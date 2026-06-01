//
//  PremiumTab.swift
//  Aura
//
//  Created by Rafael Agayev on 26.05.26.
//

import SwiftUI

struct PremiumTab: View {
    
    @Environment(\.colorScheme) private var colorScheme
    
    @State private var animeColor = false
    
    
    private var headerTitle: some View{
        Text("Premium")
            .fontModifier(size: 18, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
    }
    
    private var perProfile: some View{
        HStack(spacing: 2) {
            Text("$4.39 for your first month")
                .fontModifier(size: 14, weight: .medium, foregroundColor: .colorGreen)
            
            Text("$65.00/month per profile")
                .strikethrough(true)
                .fontModifier(size: 14, weight: .medium, foregroundColor: .colorGray)
        }
    }
    
    private var benefit: some View{
        HStack(spacing: 2) {
            Image(.info)
                .resizable()
                .scaledToFill()
                .frame(width: 14, height: 14)
            
            Text("Trial benefit.")
                .fontModifier(size: 14, weight: .medium, foregroundColor: .colorGray)
            
            if let url = URL(string: "https://www.linkedin.com/in/rafael"){
                Link("Learn more", destination: url)
                    .fontModifier(size: 14, weight: .medium, foregroundColor: .backgroundBlue)

            }
                
        }
    }
    
    private var verifiedBadge: some View{
        ItemView(icon: .iconMetaVerifiedBlack, title: "Verified badge")
    }
    
    private var maximizeDiscovery: some View{
        Text("Maximize discovery")
            .fontModifier(size: 18, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
    }
    
    private var searchOptimization: some View{
        ItemView(icon: colorScheme == .dark ? .iconCheckmarkColored : .checkmark, title: "Search optimization")
    }
    
    
    private var featuredProfile: some View{
        ItemView(icon: colorScheme == .dark ? .iconCheckmarkColored : .checkmark, title: "Featured profile")
    }
    
    private var addLinksToReels: some View{
        VStack(alignment: .leading, spacing: 4){
            ItemView(icon: colorScheme == .dark ? .iconCheckmarkColored : .checkmark, title: "Add links to Reels")
            
            Text("4 per month")
                .fontModifier(size: 13, weight: .medium, foregroundColor: .colorGreen)
                .padding(.horizontal, 24)
        }
    }
    
    private var driveEngagement: some View{
        Text("Drive engagement")
            .fontModifier(size: 18, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
    }
    
    private var upgradedProfileLinks: some View{
        ItemView(icon: colorScheme == .dark ? .iconCheckmarkColored : .checkmark, title: "Upgraded profile links")
    }
    
    private var exclusiveStickers: some View{
        ItemView(icon: colorScheme == .dark ? .iconCheckmarkColored : .checkmark, title: "Exclusive stickers")

    }
    
    private var customChatThemes: some View{
        ItemView(icon: colorScheme == .dark ? .iconCheckmarkColored : .checkmark, title: "Custom chat themes")

    }
    
    private var competitiveInsights: some View{
        ItemView(icon: colorScheme == .dark ? .iconCheckmarkColored : .checkmark, title: "Competitive insights")

    }
    
    private var protectYourBrand: some View{
        Text("Protect your brand")
            .fontModifier(size: 18, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
    }
    
    private var impersonationProtection: some View{
        ItemView(icon: colorScheme == .dark ? .iconCheckmarkColored : .checkmark, title: "Impersonation protection")

    }
    
    private var enhancedSupport: some View{
        VStack(alignment: .leading, spacing: 4){
            ItemView(icon: colorScheme == .dark ? .iconCheckmarkColored : .checkmark, title: "Enhanced support")

            VStack(alignment: .leading, spacing: 2){
                Text("chat or email with agents")
                    .fontModifier(size: 12, weight: .medium, foregroundColor: .colorGreen)
                
                Text("Get issues resolved more quickly")
                    .fontModifier(size: 12, weight: .medium, foregroundColor: .colorGreen)

                Text("Request a call from an agent")
                    .fontModifier(size: 12, weight: .medium, foregroundColor: .colorGreen)

            }
            .padding(.horizontal, 24)
            
            seeBenefitDetails
        }
    }
    
    private var seeBenefitDetails: some View{
        Button{
            
        }label: {
            Text("See benefit details")
                .fontModifier(size: 14, weight: .medium, foregroundColor: .backgroundBlue)
        }
        .padding(.horizontal, 14)
    }
    
    private var header: some View{
        VStack(alignment: .leading, spacing: 4) {
            headerTitle
            
            perProfile
            
            benefit
            
            Divider()
                .padding(.horizontal, -8)
        }
    }
    
    
    
    var body: some View {
       
        VStack(alignment: .leading, spacing: 12){
            header
            
            verifiedBadge
            
            maximizeDiscovery
            
            searchOptimization
            
            featuredProfile
            
            addLinksToReels
            
            driveEngagement
            
            upgradedProfileLinks
            
            exclusiveStickers
            
            customChatThemes
            
            competitiveInsights
            
            protectYourBrand
            
            impersonationProtection
            
            enhancedSupport
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .overlay{
            RoundedRectangle(cornerRadius: 12)
                .stroke(.colorGray, lineWidth: 1.5)
        }
        
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(
                    AngularGradient(
                        colors: [
                            .clear,
                            .clear,
                            .colorPink,
                            .colorRed,
                            .colorAccent,
                            .clear,
                            .clear
                        
                        ],
                        center: .center,
                        angle: .degrees(animeColor ? 360 : 0))
                )
                .animation(
                    .linear(duration: 3)
                    .repeatForever(autoreverses: false),
                    value: animeColor)
                    
        }
        .onAppear{
            animeColor = true
        }
    }
}
