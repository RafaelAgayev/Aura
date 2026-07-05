//
//  AdsOtherAppsItemView.swift
//  Aura
//
//  Created by Rafael Agayev on 10.06.26.
//

import SwiftUI

struct AdsOtherAppsItemView: View {
    
    let title: String
    
    let subtitle: String
    
    let greenText = "Your current experience"
    
    let isSelected: Bool
    
    var onTap: () -> Void
    
    
    @Environment(\.colorScheme) private var colorScheme
    
    private var selectedButton: some View{
        Circle()
            .stroke(isSelected ? .blueRay : .colorGray, lineWidth: 2)
            .frame(width: 20, height: 20)
            .overlay {
                Circle()
                    .fill(isSelected ? .blueRay : .clear)
                    .frame(width: 14, height: 14)
            }
    }
    
    private var headerTitle: some View{
        Text(title)
            .fontModifier(size: 16, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
    }
    
    private var headerSubtitle: some View{
        Text(subtitle)
            .fontModifier(size: 16, weight: .medium, foregroundColor: .colorGray)
            .multilineTextAlignment(.leading)
            .lineLimit(3)
    }
    
    private var greenTitle: some View{
        Text(greenText)
            .fontModifier(size: 16, weight: .medium, foregroundColor: .colorGreen)
    }
    var body: some View {
    
        VStack(alignment: .leading, spacing: 4){
            headerTitle
            
            HStack(alignment: .center){
               headerSubtitle
                
                Spacer()
                
                selectedButton
            }
            
            if isSelected{
                greenTitle
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation{
                onTap()
            }
        }
    }
}
