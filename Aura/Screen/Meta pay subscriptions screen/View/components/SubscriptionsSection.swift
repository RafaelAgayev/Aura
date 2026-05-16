//
//  SubscriptionsSection.swift
//  Aura
//
//  Created by Rafael Agayev on 12.05.26.
//

import SwiftUI

struct SubscriptionsSection: View {
    
    let image: ImageResource
    
    let title: String
    
    let subtitle: String
    
    @Environment(\.colorScheme) private var colorScheme
    
    @State private var navigate: MetaPaySubscriptionsScreen.Navigation? = nil
    
    var onTap: (MetaPaySubscriptionsScreen.Navigation) -> Void
    
    private var icon: some View{
        Image(image)
            .resizable()
            .scaledToFit()
            .frame(width: 30, height: 30)
    }
    
    private var titleHeader: some View{
        VStack(alignment: .leading, spacing: 4){
            Text(title)
                .fontModifier(size: 16, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            
            Text(subtitle)
                .fontModifier(size: 13, weight: .medium, foregroundColor: .colorGray)
        }
    }
    
    private var rightButton: some View{
        Image(.iconRightGray)
            .resizable()
            .scaledToFit()
            .frame(width: 12, height: 12)
    }
    
    var body: some View {
        HStack(spacing: 8) {
            icon
            
            titleHeader
            
            Spacer()
            
            rightButton
        }
        .contentShape(Rectangle())
        .onTapGesture {
            onTap(navigate ?? .creators)
        }
    }
}

