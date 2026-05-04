//
//  PersonalDetailsInPersonalScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 03.05.26.
//

import SwiftUI

struct PersonalDetailsInPersonalScreen: View {
    
    @Environment(\.colorScheme) private var colorScheme
    
    let title: String
    
    let subtitle: String
    
    var onTap: (PersonalScreen.Navigation) -> Void
    
    var navigation: PersonalScreen.Navigation? = nil
    
    private var title1: some View{
        Text(title)
            .fontModifier(size: 18, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
    }
    
    private var subtitle1: some View{
        Text(subtitle)
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
        HStack{
            VStack(alignment: .leading, spacing: 4){
                title1
                
                subtitle1
                
            }
            Spacer()
            
            rightIcon
        }
        .contentShape(Rectangle())
        .onTapGesture {
            onTap(navigation ?? .contactInfo)
        }
    }
}

