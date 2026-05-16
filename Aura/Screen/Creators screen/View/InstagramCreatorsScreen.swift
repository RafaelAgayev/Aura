//
//  InstagramCreatorsScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 12.05.26.
//

import SwiftUI

struct InstagramCreatorsScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Environment(\.colorScheme) private var colorScheme
    
    @StateObject private var vm: InstagramCreatorsViewModel = .init()
    
    @State private var showInstagramCreatorProfiles = false
    
    @State private var selectedAccount: InstagramCreatorsModel?
    
    private var backButton: some View{
        Image(systemName: "chevron.left")
            .contentShape(Rectangle())
            .fixedSize()
            .frame(width: 24, height: 24)
            .onTapGesture {
                withAnimation(.spring()){
                    dismiss()
                }
            }
    }
    
    private var title: some View{
        Text("Discover Instagram Creators")
            .fontModifier(size: 26, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
    }
    
    private var creators: some View{
        LazyVStack(alignment: .leading, spacing: 12){
            ForEach(Array(vm.account.enumerated()), id: \.element.id){ index, account in
                HStack(spacing: 8) {
                    Image(account.image)
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 45, height: 45)
                    
                    VStack(alignment: .leading, spacing: 4){
                        Text(account.name)
                            .fontModifier(size: 16, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
                        
                        HStack(spacing: 6){
                            Text(account.follower)
                                .fontModifier(size: 14, weight: .medium, foregroundColor: .colorGray)
                            
                            Text("followers")
                                .fontModifier(size: 14, weight: .medium, foregroundColor: .colorGray)

                        }
                    }
                    
                    Spacer()
                    
                    Image(.iconRightGray)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 12, height: 12)
                    
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    selectedAccount = account
                    showInstagramCreatorProfiles = true
                }
                
                if index != vm.account.count - 1 {
                    Divider()
                        .padding(.horizontal, -8)
                }
            }
           
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .roundedRectangleStyle(
            cornerRadius: 12,
            backgroundColor: colorScheme == .dark ? .colorBlack.opacity(0.05) : .colorWhite.opacity(0.05),
            borderColor: .colorGray.opacity(0.7),
            borderWidth: 1.5
        )
    }
    
    private var scrollView: some View{
        ScrollView{
            VStack(alignment: .leading, spacing: 16){
                title
                
                creators
                
            }
        }
    }
    var body: some View {
        
        VStack(alignment: .leading, spacing: 16){
            backButton
            
            scrollView
            
            Spacer()
        }
        .navigationDestination(isPresented: $showInstagramCreatorProfiles){
            if selectedAccount != nil{
                InstagramCreatorProfilesScreen(model: $selectedAccount)
            }
        }
        .navigationBarBackButtonHidden()
        .padding(.top, 32)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 16)
    }
}

