//
//  StandartTabDetailsScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 29.05.26.
//

import SwiftUI

struct StandartTabDetailsScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Environment(\.colorScheme) private var colorScheme
    
    private var backButton: some View{
        Image(colorScheme == .dark ? .iconXMarkColored : .iconXMark)
            .resizable()
            .scaledToFill()
            .frame(width: 18, height: 18)
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation{
                    dismiss()
                }
            }
    }
    
    private var headerTitle: some View{
        Text("Meta Verified Standart")
            .fontModifier(size: 18, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
    }
    
    private var verifiedBadge: some View{
        ItemTabView(
            image: colorScheme == .dark ? .iconSuccessUsername : .checkmark,
            title: "Verified badge",
            description: "Get a verified badge that shows up everywhere you do and help your audience feel more confident engaging with you."
        )
    }
    
    private var protectYourBrand: some View{
        VStack(alignment: .leading, spacing: 8){
            Text("Protect your brand")
                .fontModifier(size: 18, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            ItemTabView(
                image: colorScheme == .dark ? .iconCheckmarkColored : .checkmark,
                title: "Impersonation protection",
                description: "We proactively monitor your profile. If we decide someone is pretending to be you, we'll remove them.")
        }
    }
    
    private var enhancedSupport: some View{
        HStack(spacing: 0){
            ItemTabView(image: colorScheme == .dark ? .iconCheckmarkColored : .checkmark, title: "Enhanced support", description: "• Chat or email with an agent in 15 languages ")
            
            if let url = URL(string: "https://www.livescore.com"){
                Link("Learn more", destination: url)
                    .fontModifier(size: 14, weight: .medium, foregroundColor: .colorBlue)
            }
        }
    }
    
    private var driveEngagement: some View{
        
        VStack(alignment: .leading, spacing: 10){
            
            Text("Drive engagement")
                .fontModifier(size: 18, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            
            ItemTabView(image: colorScheme == .dark ? .iconCheckmarkColored : .checkmark, title: "Upgrade profile links", description: "Enhance your profile to visually showcase more of what your brand has to offer.")
            
            ItemTabView(image: colorScheme == .dark ? .iconCheckmarkColored : .checkmark, title: "Exclusive stickers", description: "Express yourself with stickers only available to Meta Verified subscribers.")
        }
    }
    
    private var maximizeDiscovery: some View{
        VStack(alignment: .leading, spacing: 10){
            Text("Maximize discovery")
                .fontModifier(size: 18, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            
            ItemTabView(image: colorScheme == .dark ? .iconCheckmarkColored : .checkmark, title: "Search Optimization", description: "Help people find you by appearing higher in search results when they search for you.")
        }
    }
    
    private var scrollContent: some View{
        ScrollView{
            VStack(alignment: .leading, spacing: 14){
                
                headerTitle
                
                verifiedBadge
                
                protectYourBrand
                
                enhancedSupport
                
                driveEngagement
                
                maximizeDiscovery
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 18){
            backButton
            
            scrollContent
        }
        .padding(.vertical, 24)
        .padding(.horizontal, 18)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}


