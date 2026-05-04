//
//  EditView.swift
//  Aura
//
//  Created by Rafael Agayev on 03.05.26.
//

import SwiftUI

struct EditView: View {
    
    let named: String
    
    var navigation: EditProfileScreen.RouteField? = nil
    
    var onTapped: (EditProfileScreen.RouteField) -> Void
    
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        
        HStack{
            Text(named)
                .fontModifier(size: 14, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            
            Spacer()
            Image(.iconRightGray)
                .resizable()
                .scaledToFit()
                .frame(width: 12, height: 12)
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 8)
        .contentShape(Rectangle())
        .onTapGesture {
            onTapped(navigation ?? .name)
        }
    }
}

