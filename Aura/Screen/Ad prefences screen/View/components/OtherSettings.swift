//
//  OtherSettings.swift
//  Aura
//
//  Created by Rafael Agayev on 07.06.26.
//

import SwiftUI

struct OtherSettings: View {
    
    @Environment(\.colorScheme) private var colorScheme
    
    var onTap: (AdPrefencesScreen.Route) -> Void
    
    private var header: some View{
        Text("Other settings")
            .fontModifier(size: 18, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
    }
    
    private var component: some View{
        VStack(alignment: .leading, spacing: 2){
            Text("Social interactions")
                .fontModifier(size: 14, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            
            HStack{
                Text("Choose who can see your social interactions alongside ads.")
                    .fontModifier(size: 14, weight: .medium, foregroundColor: .colorGray)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                
                Spacer()
                
                Image(.iconRightGray)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 14, height: 14)
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation{
                onTap(.socialInteractions)
            }
        }
        .roundedRectangleStyle(cornerRadius: 18, backgroundColor: .clear, borderColor: .colorGray, borderWidth: 1.5)
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            header
            
            component
        }
    }
}


