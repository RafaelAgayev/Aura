//
//  MetaPaySubscriptionsScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 30.04.26.
//

import SwiftUI

struct MetaPaySubscriptionsScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Environment(\.colorScheme) private var colorScheme
    
    @State private var navigation: Navigation? = nil
    
    @StateObject private var vm: MetaPaySubscriptionsViewModel = .init()
    
    
    private var backButton: some View{
        Image(systemName: "chevron.left")
            .resizable()
            .scaledToFit()
            .frame(width: 20, height: 20)
            .onTapGesture {
                dismiss()
            }
    }
    
    private var list: some View{
        VStack(alignment: .leading, spacing: 12){
            SubscriptionsSection(image: .metaVerified, title: "Meta Verified", subtitle: "Build trust with your audience", onTap: { nav in
                navigation = .metaVerified
            })
            
            Divider()
                .padding(.horizontal, -8)
            
            SubscriptionsSection(image: .creators, title: "Creators", subtitle: "Support your favorite creators", onTap: { nav in
                navigation = .creators
            })
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .roundedRectangleStyle(cornerRadius: 14, backgroundColor: colorScheme == .dark ? .colorBlack.opacity(0.05) : .colorWhite.opacity(0.05), borderColor: .colorGray, borderWidth: 1.3)
    }
    
    private var header: some View{
        VStack(alignment: .leading, spacing: 8){
            Text("Subscriptions")
                .fontModifier(size: 20, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            
            Text("Find and manage your subscriptions all in one place.")
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .fontModifier(size: 16, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
        }
    }
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 22){
            backButton
            
            header
            
            list
            
            Spacer()
        }
        .navigationDestination(item: $navigation) { route in
            switch route{
            case .metaVerified:
                MetaVerifiedInSubscriptionsScreen()
            case .creators:
                CreatorScreenSubscriptions()
            }
        }
        .padding(.top, 36)
        .padding(.horizontal, 12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .navigationBarBackButtonHidden()
    }
}

extension MetaPaySubscriptionsScreen{
    enum Navigation: Identifiable{
        
        var id: Self { self }
        
        case metaVerified, creators
        
    }
}
