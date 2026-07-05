//
//  MetaPayScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 27.04.26.
//

import SwiftUI

struct MetaPayScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Environment(\.colorScheme) private var colorScheme
    
    @State private var navigation: Navigation? = nil
    
    
    private var metaVerified: some View{
        VStack(alignment: .leading, spacing: 8){
            Image(colorScheme == .dark ? .iconMetaVerifiedWhite : .iconMetaVerifiedBlack)
                .resizable()
                .scaledToFit()
                .frame(width: 26, height: 26)
            
            Text("Meta Verified")
                .fontModifier(size: 16, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .contentShape(Rectangle())
        .roundedRectangleStyle(
            cornerRadius: 14,
            backgroundColor: colorScheme == .dark ? .colorBlack.opacity(0.15) : .colorWhite.opacity(0.15),
            borderColor: .colorGray, borderWidth: 1.5)
        .onTapGesture {
            navigation = .metaVerified
        }
    }
    
    private var AIGlasses: some View{
        Link(destination: URL(string: "https://www.meta.com")!){
            VStack(alignment: .leading, spacing: 8){
                Image(colorScheme == .dark ? .iconAIGlassesBlack : .iconAIGlassesWhite)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 26, height: 26)
                
                Text("AI Glasses")
                    .fontModifier(size: 16, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
                
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .contentShape(Rectangle())
            .roundedRectangleStyle(
                cornerRadius: 14,
                backgroundColor: colorScheme == .dark ? .colorBlack.opacity(0.15) : .colorWhite.opacity(0.15),
                borderColor: .colorGray, borderWidth: 1.5)
        }
    }
    
    private var passwordAndSecurity: some View{
        PagesScreen(
            icon: colorScheme == .dark ? .iconSecurityColored : .iconSecurityBlack,
            name: "Password and security",
            onTap: { _ in navigation = .passwordAndSecurity})
    }
    
    private var altMenu: some View{
        VStack(alignment: .leading, spacing: 12){
            Text("More from Meta")
                .fontModifier(size: 18, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            
            HStack(spacing: 12) {
                metaVerified
                
                AIGlasses
            }
        }
        .padding(.horizontal, 4)
    }
    
    private var metaPay: some View{
        PagesScreen(
            icon: colorScheme == .dark ? .iconMetaPayColored : .iconMetaPayBlack,
            name: "Meta pay",
            onTap: { _ in navigation = .metaPay})
    }
    
    private var subscriptions: some View{
        PagesScreen(
            icon: colorScheme == .dark ? .iconSubsColored : .iconSubsBlack,
            name: "Subscriptions", onTap: { _ in navigation = .subscriptions})
    }
    
    private var yourInformationAndPermissions: some View{
        PagesScreen(
            icon: colorScheme == .dark ? .yourInformationBlack1 : .yourInformationBlack,
            name: "Your information and Permissions",
            onTap: { _ in navigation = .yourInformation})
    }
    
    private var connectedExperiences: some View{
        PagesScreen(
            icon: colorScheme == .dark ? .iconAtomColored : .iconAtomBlack,
            name: "Connected expreriences",
            onTap: { _ in navigation = .connected})
    }
    
    private var adPreferences: some View{
        PagesScreen(
            icon: colorScheme == .dark ? .iconSpeakerColored : .iconSpeakerBlack,
            name: "Ad preferences",
            onTap: { _ in navigation = .adPreferences})
    }
    
    private var navigationTab: some View{
        VStack(alignment: .leading, spacing: 16){
            passwordAndSecurity
            
            Divider()
                .padding(.horizontal, -8)
            
            connectedExperiences
            
            Divider()
                .padding(.horizontal, -8)
            
            yourInformationAndPermissions
            
            
            Divider()
                .padding(.horizontal, -8)
            
            adPreferences
            
            Divider()
                .padding(.horizontal, -8)
            
            metaPay
            
            Divider()
                .padding(.horizontal, -8)
            
            subscriptions
            
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 12)
        .frame(maxWidth: .infinity)
        .roundedRectangleStyle(
            cornerRadius: 14,
            backgroundColor: colorScheme == .dark ? .colorBlack.opacity(0.15) : .colorWhite.opacity(0.15),
            borderColor: .colorGray,
            borderWidth: 1
        )
        
    }
    
    private var manageAccounts: some View{
        PagesScreen(
            icon: colorScheme == .dark ? .iconAccountsColored : .iconAccountsBlack,
            name: "Manage accounts",
            onTap: { _ in navigation = .manageAccounts})
        .padding(.vertical, 10)
        .padding(.horizontal, 12)
        .frame(maxWidth: .infinity)
        .roundedRectangleStyle(
            cornerRadius: 14,
            backgroundColor: colorScheme == .dark ? .colorBlack.opacity(0.15) : .colorWhite.opacity(0.15),
            borderColor: .colorGray,
            borderWidth: 1
        )
    }
    private var header: some View{
        VStack(alignment: .center, spacing: 6){
            Text("Accounts Center")
                .fontModifier(size: 20, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            
            Text("""
                Manage your connected experiences and 
                account settings across Meta tehcnologies like 
                Facebook, Instagram and Meta Horizon
                """)
            .fontModifier(size: 14, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            .multilineTextAlignment(.center)
            .lineLimit(3)
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
    
    private var account: some View{
        HStack(spacing: 4){
            Circle()
                .fill(colorScheme == .dark ? .colorAccent : .colorBlue)
                .strokeBorder(lineWidth: 0.5)
                .frame(width: 18, height: 18)
                .overlay(alignment: .topTrailing) {
                    Circle()
                        .fill(colorScheme == .dark ? .colorGreenWhatsapp : .colorPink)
                        .frame(width: 12, height: 12)
                        .padding(.bottom, 20)
                        
                        
                }
            
            VStack(alignment: .leading, spacing: 4){
                Text("Profiles and personal details")
                    .fontModifier(size: 14, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
                
                Text("3 profiles")
                    .fontModifier(size: 14, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite.opacity(0.2) : .colorBlack.opacity(0.15))
            }
            
            Spacer()
            
            Image(colorScheme == .dark ? .iconRightGray : .iconRightBlack)
                .resizable()
                .scaledToFit()
                .frame(width: 14, height: 14)
            
        }
        .padding(.vertical, 18)
        .padding(.horizontal, 10)
        .frame(maxWidth: .infinity, alignment: .leading)
        .roundedRectangleStyle(
            cornerRadius: 14,
            backgroundColor: colorScheme == .dark ? .colorBlack.opacity(0.15) : .colorWhite.opacity(0.15),
            borderColor: .colorGray, borderWidth: 1.5)
        .onTapGesture {
            navigation = .personal
        }
    }
    var body: some View {
        
        ScrollView{
            VStack(alignment: .leading, spacing: 22){
                
                header
                
                account
                
                navigationTab
                
                manageAccounts
                
                altMenu
                
            }
            .padding(.horizontal, 8)
            .frame(maxWidth: .infinity, alignment: .top)
            .padding(.top, -10)
        }
        .navigationDestination(item: $navigation){ navigate in
           routeBody(navigation: navigate)
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            toolbar
        }
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent{
        ToolbarItem(placement: .topBarLeading) {
            Image(colorScheme == .dark ? .iconXButtonGray : .iconXBlack)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .onTapGesture {
                    dismiss()
                }
        }
        
        ToolbarItem(placement: .principal) {
            HStack(spacing: 4) {
                Image(colorScheme == .dark ? .iconMetaColored : .iconMetaBlack)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                
                Text("Meta")
                    .fontModifier(size: 18, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            }
        }
    }
}

extension MetaPayScreen{
    enum Navigation{
        case personal,
             passwordAndSecurity,
             connected,
             yourInformation,
             adPreferences,
             metaPay,
             subscriptions,
             manageAccounts,
             metaVerified
    }
    
    @ViewBuilder
    func routeBody(navigation: Navigation) -> some View {
        switch navigation{
        case .yourInformation:
            YourPermissionsScreen()
            
        case .personal:
            PersonalScreen()
            
        case .passwordAndSecurity:
            PasswordAndSecurityScreen()
            
        case .connected:
            ConnectedExperienceScreen()
            
        case .subscriptions:
            MetaPaySubscriptionsScreen()
            
        case .adPreferences:
            AdPrefencesScreen()
            
        case .manageAccounts:
            ManageAccountsScreen()
            
        case .metaPay:
            MetaPayInListScreen()
            
        case .metaVerified:
            MetaVerifiedScreen()
        }
    }
}

