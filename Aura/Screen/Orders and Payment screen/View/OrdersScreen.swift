//
//  OrdersScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 26.04.26.
//

import SwiftUI

struct OrdersScreen: View {
    
    @StateObject private var vm = OrdersViewModel()
    
    @State private var sheetNav: sheetNavigation? = nil
    
    @State private var navDestination: Navigation? = nil
    
    
    @Environment(\.dismiss) private var dismiss
    
    @Environment(\.colorScheme) private var colorScheme
    
    private var subscriptions: some View{
        VStack(alignment: .leading, spacing: 12){
            Text("Payment information")
                .fontModifier(size: 14, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            
            ActionsViewerOrders(
                image: colorScheme == .dark ? .iconCalendarWhite : .iconCalendarBlack,
                text: "Subscriptions",
                onTap: {
                navDestination = .subscriptions
            })
        }
    }
    
    private var actions: some View{
        VStack(alignment: .leading, spacing: 20){
            subscriptions
            
            Text("Settings")
                .fontModifier(size: 14, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            
            detection
            
            security
            
            help
        }
        .padding(.horizontal, 8)
    }
    
    private var security: some View{
        ActionsViewerOrders(
            image: colorScheme == .dark ? .iconSecurityBlack : .iconSecurityWhite,
            text: "Security",
            onTap: {
                navDestination = .security
            })
    }
    
    private var detection: some View{
        ActionsViewerOrders(
            image: colorScheme == .dark ?  .iconAutoDetectionWhite : .iconAutoDetectionBlack,
            text: "Auto-detection",
            onTap: {
                navDestination = .autoDetection
            })
    }
    
    private var help: some View{
        ActionsViewerOrders(
            image: colorScheme == .dark ? .iconSupportBlack : .iconSupportWhite,
            text: "Help & support",
            onTap: {
                navDestination = .help
            })
    }
    
    private var metaPay: some View{
        VStack(alignment: .leading, spacing: 8){
            HStack(spacing: 3) {
                Image(.iconMetaLogo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                
                Text("MetaPay")
                    .fontModifier(size: 16, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            }
            
            Text("Transactions, credit cards, debit cards,\n shipping info, PayPal")
                .fontModifier(size: 12, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .roundedRectangleStyle(cornerRadius: 12, backgroundColor: colorScheme == .dark ? .colorWhite.opacity(0.22) : .colorBlack.opacity(0.15), borderColor: .colorBlack, borderWidth: 1.2)
        .onTapGesture {
            sheetNav = .metaPay
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24){
            metaPay
                .padding(.top, 10)
            
          actions
            
            Spacer()
        }
        .padding(.horizontal, 8)
        .sheet(item: $sheetNav){ nav in
            switch nav{
            case .metaPay:
                MetaPayScreen()
            case .threeLine:
                ShopAccountScreen()
                    .presentationDetents([.fraction(0.3)])
                    .presentationCornerRadius(36)
                    .presentationDragIndicator(.visible)
            }
        }
        
        .navigationDestination(item: $navDestination) { navigation in
            switch navigation{
            case .subscriptions:
                SubscriptionsScreen()
            case .autoDetection:
                AutoDetectionScreen()
            case .help:
                HelpSupportScreen()
            case .security:
                SecurityScreen()
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            toolbar
        }
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent{
        ToolbarItem(placement: .topBarLeading) {
            Image(systemName: "chevron.left")
                .resizable()
                .scaledToFit()
                .frame(width: 14, height: 14)
                .foregroundStyle(colorScheme == .dark ? .colorWhite : .colorBlack)
                .onTapGesture {
                    dismiss()
                }
        }
        
        ToolbarItem(placement: .principal) {
            Text("Orders and payments")
                .fontModifier(size: 16, weight: .bold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
        }
        
        ToolbarItem(placement: .topBarTrailing) {
            HStack(spacing: 12) {
                Image(colorScheme == .dark ? .iconPaymentBlack : .iconPayment)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                
                Image(colorScheme == .dark ? .iconThreeLineBlack : .iconThreeLine)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .onTapGesture {
                        sheetNav = .threeLine
                    }
            }
        }
    }
}

extension OrdersScreen{
    enum sheetNavigation: Identifiable{
        
        case metaPay, threeLine
        
        var id: Self { self }
    }
    
    enum Navigation{
        case subscriptions, autoDetection, security, help
        
        var nav: String{
            switch self {
            case .subscriptions:
                return "Subscriptions"
            case .autoDetection:
                return "AutoDetection"
            case .security:
                return "Security"
            case .help:
                return "Help & support"
            }
        }
    }
}
