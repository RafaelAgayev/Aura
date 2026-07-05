//
//  SharingProfilesScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 05.07.26.
//

import SwiftUI

struct SharingProfilesScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Environment(\.colorScheme) private var colorScheme
    
    @State private var navigation: Navigation? = nil
    
    
    private func backButton() -> some View{
        Image(systemName: "chevron.left")
            .foregroundStyle(colorScheme == .dark ? .colorWhite : .colorBlack)
            .contentShape(Rectangle())
            .onTapGesture {
                dismiss()
            }
    }
    
    private func facebookProfile() -> some View{
        ContentSection(
            profilImage: .baby,
            socialWebIcon: colorScheme == .dark ? .iconFacebook : .iconFacebookBlack,
            profilName: "Rafa El",
            socialWebName: "Facebook",
            onTapped: {
                navigation = .facebook
            }
        )
    }
    
    private func instagramProfile() -> some View{
        ContentSection(
            profilImage: .thomasShelby,
            socialWebIcon: colorScheme == .dark ? .iconInstagramColored : .iconInstagramBlack,
            profilName: "zakir.qaralov32",
            socialWebName: "Instagram",
            onTapped: {
                navigation = .instagram
            }
        )
    }
    
    private func instagramProfile2() -> some View{
        ContentSection(
            profilImage: .boy10,
            socialWebIcon: colorScheme == .dark ? .iconInstagramColored : .iconInstagramBlack,
            profilName: "r.a_rus",
            socialWebName: "Instagram",
            onTapped: {
                navigation = .instagram2
            }
        )
    }
    
    private func addAccounts() -> some View{
        Text("Add accounts")
            .fontModifier(size: 18, weight: .medium, foregroundColor: .blueRay)
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation(.spring()){
                    navigation = .addAccounts
                }
            }
    }
    
    private func mainContent() -> some View{
        VStack(alignment: .leading, spacing: 16){
            
            Text("Share from")
                .fontModifier(size: 18, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            
            VStack(alignment: .leading, spacing: 12){
                facebookProfile()
                
                Divider()
                    .padding(.horizontal, -12)
                
                instagramProfile()
                
                Divider()
                    .padding(.horizontal, -12)
                
                instagramProfile2()
                
                Divider()
                    .padding(.horizontal, -12)
                
                addAccounts()
            }
            .padding(.all, 16)
            .frame(maxWidth: .infinity, alignment: .leading)
            .roundedRectangleStyle(cornerRadius: 18, backgroundColor: .clear, borderColor: .colorGray, borderWidth: 1.5)
        }
       
    }
    
    private func headerTitle() -> some View{
        Text("Sharing across profiles")
            .fontModifier(size: 24, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
    }
    
    private func headerSubtitle() -> some View{
        Text("Share your content to more than one account at the same time")
            .fontModifier(size: 20, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
    }
    
    private func scrollContent() -> some View{
        ScrollView{
            VStack(alignment: .leading, spacing: 12){
                headerTitle()
                
                headerSubtitle()
                
                mainContent()
            }
        }
    }
    
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            backButton()
            
            scrollContent()
        }
        .padding(.top, 40)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 12)
        .toolbar(.hidden)
        .navigationBarBackButtonHidden()
        .navigationDestination(item: $navigation) { selection in
            navigationBody(navigation: selection)
        }
    }
}

extension SharingProfilesScreen{
    enum Navigation: Identifiable{
        var id: Self { self }
        
        case facebook, instagram, instagram2, addAccounts
        
    }
    
    @ViewBuilder
    func navigationBody(navigation: Navigation) -> some View{
        switch navigation{
        case .facebook:
            EmptyView()
            
        case .instagram:
            EmptyView()
            
        case .instagram2:
            EmptyView()
            
        case .addAccounts:
            EmptyView()
        }
    }
}

