//
//  PersonalView.swift
//  Aura
//
//  Created by Rafael Agayev on 30.04.26.
//

import SwiftUI

struct PersonalView: View {
    
    let profilImg: ImageResource
    
    let socialWebIcon: ImageResource
    
    let nickName: String
    
    let socialWebName: String
    
    var onTap: (PersonalScreen.Navigation) -> Void
    
    var navigation: PersonalScreen.Navigation? = nil
    
    @Environment(\.colorScheme) private var colorScheme
    
    private var profileImage: some View{
        Image(profilImg)
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .frame(width: 40, height: 40)
            .overlay(alignment: .bottomTrailing) {
                Circle()
                    .fill(colorScheme == .dark ? .colorWhite : .colorBlack)
                    .frame(width: 16, height: 16)
                    .overlay {
                        Image(socialWebIcon)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .frame(width: 12, height: 12)
                    }
            }
    }
    
    private var name: some View{
        Text(nickName)
            .fontModifier(size: 16, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
    }
    
    private var webName: some View{
        Text(socialWebName)
            .fontModifier(size: 16, weight: .medium, foregroundColor: colorScheme == .dark ? .colorGray : .colorBlack.opacity(0.7))
    }
    
    private var rightIcon: some View{
        Image(.iconRightGray)
            .resizable()
            .scaledToFit()
            .frame(width: 14, height: 14)
            .padding(.horizontal, 6)
    }
    
    var body: some View {
        HStack(spacing: 8) {
            profileImage
            
            VStack(alignment: .leading, spacing: 4){
                name
                webName
            }
            
            Spacer()
            
            rightIcon
        }
        .contentShape(Rectangle())
        .onTapGesture {
            onTap(navigation ?? .addAccounts)
        }
    }
}

