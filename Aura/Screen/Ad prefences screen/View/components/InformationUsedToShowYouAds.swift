//
//  InformationUsedToShowYouAds.swift
//  Aura
//
//  Created by Rafael Agayev on 06.06.26.
//

import SwiftUI

struct InformationUsedToShowYouAds: View {
    
    @Environment(\.colorScheme) private var colorScheme
        
    var onTap: (AdPrefencesScreen.Route) -> Void
    
    private var header: some View{
        Text("Information used to show you ads")
            .fontModifier(size: 18, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
    }
    
    private var topContent: some View{
        VStack(alignment: .leading, spacing: 2){
            Text("Categories used to reach you")
                .fontModifier(size: 14, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            
            HStack{
                Text("Information you share on your profile or ")
                    .fontModifier(size: 14, weight: .medium, foregroundColor: .colorGray)
                
                Spacer()
                
                Image(.iconRightGray)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 14, height: 14)
            }
            
            Text("other categories used to reach you")
        }
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation{
                onTap(.categoriesUsed)
            }
        }
    }
    
    private var midContent: some View{
        VStack(alignment: .leading, spacing: 2){
            Text("Activity information from ad partners")
                .fontModifier(size: 14, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            
            Text("Choose whether we use this ")
                .fontModifier(size: 14, weight: .medium, foregroundColor: .colorGray)

            HStack{
                Text("information to show you ads that are ")
                    .fontModifier(size: 14, weight: .medium, foregroundColor: .colorGray)

                Spacer()
                
                Image(systemName: "arrow.up.right")
                    .foregroundStyle(colorScheme == .dark ? .colorWhite : .colorBlack)
            }
            
            Text("more relevant to you")
                .fontModifier(size: 14, weight: .medium, foregroundColor: .colorGray)

            Text("Using this information")
                .fontModifier(size: 14, weight: .medium, foregroundColor: .colorGreen)

        }
        .contentShape(Rectangle())
        .onTapGesture {
            onTap(.activityInformation)
        }
    }
    
    private var bottomContent: some View{
        VStack(alignment: .leading, spacing: 2){
            Text("Audience-based advertising")
                .fontModifier(size: 14, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            
            HStack(alignment: .center) {
                Text("Advertisers whose audiences you've been included in based on your activity or information")
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                    .fontModifier(size: 14, weight: .medium, foregroundColor: .colorGray)

                Spacer()
                
                Image(.iconRightGray)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 14, height: 14)
            }
            
        }
        .contentShape(Rectangle())
        .onTapGesture {
            onTap(.audienceBased)
        }
    }
    
    private var content: some View{
        VStack(alignment: .leading, spacing: 10){
            topContent
            
            Divider()
                .padding(.horizontal, -8)
            
            midContent
            
            Divider()
                .padding(.horizontal, -8)
            
            bottomContent
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .roundedRectangleStyle(cornerRadius: 18, backgroundColor: .clear, borderColor: .colorGray, borderWidth: 1.5)
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            header
            
            content
        }
    }
}
