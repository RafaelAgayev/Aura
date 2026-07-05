//
//  ContentSection.swift
//  Aura
//
//  Created by Rafael Agayev on 05.07.26.
//

import SwiftUI

struct ContentSection: View {
    let profilImage: ImageResource
    
    let socialWebIcon: ImageResource
    
    let profilName: String
    
    let socialWebName: String
    
    @Environment(\.colorScheme) private var colorScheme
    
    var onTapped: () -> Void
    
    
    private func imgResource() -> some View{
        Image(profilImage)
            .resizable()
            .scaledToFill()
            .clipShape(Circle())
            .frame(width: 34, height: 34)
            .overlay(alignment: .bottomTrailing) {
                Circle()
                    .fill(colorScheme == .dark ? .colorBlack : .colorWhite)
                    .frame(width: 16, height: 16)
                    .overlay {
                        Image(socialWebIcon)
                            .resizable()
                            .scaledToFill()
                            .contentShape(Circle())
                            .frame(width: 12, height: 12)
                    }
            }
    }
    
    private func nameAndSocialWebName() -> some View{
        VStack(alignment: .leading,spacing: 4) {
            Text(profilName)
                .fontModifier(size: 18, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            
            Text(socialWebName)
                .fontModifier(size: 18, weight: .medium, foregroundColor: .colorGray)
        }
    }
    
    private func navigationButton() -> some View{
        Image(.iconRightGray)
            .resizable()
            .scaledToFill()
            .frame(width: 12, height: 12)
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 14){
            imgResource()
            
            nameAndSocialWebName()
            
            Spacer()
            
            navigationButton()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .contentShape(Rectangle())
        .onTapGesture {
            onTapped()
        }
    }
}
