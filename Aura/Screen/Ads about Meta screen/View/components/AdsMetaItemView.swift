//
//  AdsMetaItemView.swift
//  Aura
//
//  Created by Rafael Agayev on 09.06.26.
//

import SwiftUI

struct AdsMetaItemView: View {
    
    let title: String
    let subtitle: String
    
    let greenTitle: String = "This is your current experience"
    
    let isSelected: Bool
    
    let onTap: () -> Void
    
    @Environment(\.colorScheme) private var colorScheme
    
    private var header: some View{
        Text(title)
            .fontModifier(size: 16, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            .multilineTextAlignment(.leading)
            .lineLimit(3)
    }
    
    private var subtitleHeader: some View{
        Text(subtitle)
            .fontModifier(size: 16, weight: .medium, foregroundColor: .colorGray)
    }
    
    private var greenTitleHeader: some View{
        Text(greenTitle)
            .fontModifier(size: 14, weight: .medium, foregroundColor: .colorGreen)

        
    }
    
    private var selected: some View{
        Circle()
            .stroke(isSelected ? .blueRay : .colorGray, lineWidth: 1.5)
            .frame(width: 20, height: 20)
            .overlay {
                if isSelected{
                    Circle()
                        .fill(.blueRay)
                        .frame(width: 16, height: 16)
                }
            }
    }
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4){
            header
            
            HStack{
                subtitleHeader
                
                Spacer()
                
                selected
            }
            
            if isSelected{
                greenTitleHeader
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            onTap()
        }
    }
}


