//
//  ListView.swift
//  Aura
//
//  Created by Rafael Agayev on 07.05.26.
//

import SwiftUI

struct ListView: View {
    
    @Environment(\.colorScheme) private var colorScheme
    
   
    
    let text: String
    
    var navigation: (PasswordAndSecurityScreen.Navigation) -> Void
    
    @State private var nav: PasswordAndSecurityScreen.Navigation? = nil
    
    var body: some View {
        HStack{
            textName
            
            Spacer()
            
            button
        }
        .contentShape(Rectangle())
        .onTapGesture {
            navigation(nav ?? .changePassword)
        }
        
    }
    
    private var textName: some View{
        Text(text)
            .fontModifier(size: 16, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
    }
    
    private var button: some View{
        Image(.iconRightGray)
            .resizable()
            .scaledToFit()
            .frame(width: 14, height: 14)
    }
}


