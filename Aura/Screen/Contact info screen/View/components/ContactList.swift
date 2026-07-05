//
//  ContactList.swift
//  Aura
//
//  Created by Rafael Agayev on 10.05.26.
//

import SwiftUI

struct ContactList: View {
    
    let icon: ImageResource
    
    let name: String
    
    @Environment(\.dismiss) private var dismiss
    
    @Environment(\.colorScheme) private var colorScheme
    
    var navigation: (ContactInfoScreen.Navigation) -> Void
    
    @State private var navState: ContactInfoScreen.Navigation? = nil
    
    
    var body: some View {
        
        HStack(spacing: 6){
            Image(icon)
                .resizable()
                .scaledToFit()
                .frame(width: 18, height: 18)
            
            Text(name)
                .fontModifier(
                    size: 18,
                    weight: .semibold,
                    foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            
            Spacer()
            
            Image(colorScheme == .dark ? .iconRightGray : .iconRightBlack)
                .resizable()
                .scaledToFit()
                .frame(width: 14, height: 14)
        }
        .contentShape(Rectangle())
        .padding(.horizontal, 16)
        .onTapGesture {
            navigation(navState ?? .email)
        }
        
    }
}

