//
//  FindCreatorsSection.swift
//  Aura
//
//  Created by Rafael Agayev on 12.05.26.
//

import SwiftUI

struct FindCreatorsSection: View {
    
    let image: ImageResource
    
    let title: String
    
    let subtitle: String
    
    @Environment(\.colorScheme) private var colorScheme
    
    var onTap: () -> Void
    
    private var icon: some View{
        Image(image)
            .resizable()
            .scaledToFit()
            .frame(width: 22, height: 22)
    }
    
    private var headerTitle: some View{
        VStack(alignment: .leading, spacing: 4) {
            Text("Find instagram creators")
                .fontModifier(size: 14, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            
            Text("Find and follow popular accounts")
                .fontModifier(size: 14, weight: .medium, foregroundColor: .colorGray)
        }
    }
    
    private var rightButton: some View{
        Image(.iconRightGray)
            .resizable()
            .scaledToFit()
            .frame(width: 12, height: 12)
    }
    
    var body: some View {
        HStack(spacing: 10) {
            icon
            
            headerTitle
            
            Spacer()
            
            rightButton
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .roundedRectangleStyle(cornerRadius: 14, backgroundColor: colorScheme == .dark ? .colorBlack.opacity(0.05) : .colorWhite.opacity(0.05), borderColor: .colorGray, borderWidth: 1.22)
        .contentShape(Rectangle())
        .onTapGesture {
            onTap()
        }
    }
}

