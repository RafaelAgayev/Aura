//
//  AdsShownMeta.swift
//  Aura
//
//  Created by Rafael Agayev on 07.06.26.
//

import SwiftUI

struct AdsShownMeta: View {
    
    @Environment(\.colorScheme) private var colorScheme
    
    var onTap: (AdPrefencesScreen.Route) -> Void
    
    private var header: some View{
        Text("Ads shown outside of Meta")
            .fontModifier(size: 18, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
    }
    
    private var component1: some View{
        VStack(alignment: .leading, spacing: 2){
            Text("Ads in other apss")
                .fontModifier(size: 14, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            
            HStack(alignment: .center){
                Text("Choose whether you see ads from Meta Audience Network in other apps.")
                    .fontModifier(size: 14, weight: .medium, foregroundColor: .colorGray)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                
                Spacer()
                
                Image(.iconRightGray)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 14, height: 14)
            }
            
            Text("Showing you ads in other apps")
                .fontModifier(size: 14, weight: .medium, foregroundColor: .colorGreen)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation{
                onTap(.adsInOtherApps)
            }
        }
    }
    
    
    private var component2: some View{
        VStack(alignment: .leading, spacing: 2){
            Text("Ads About Meta")
                .fontModifier(size: 14, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            
            HStack{
                Text("Choose whether we use your activity to show you ads about Meta on other platforms.")
                    .fontModifier(size: 14, weight: .medium, foregroundColor: .colorGray)
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                
                Spacer()
                
                Image(.iconRightGray)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 14, height: 14)
            }
            
            Text("Using this information")
                .fontModifier(size: 14, weight: .medium, foregroundColor: .colorGreen)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation{
                onTap(.adsAboutMeta)
            }
        }
    }
    
    private var mainContent: some View{
        VStack(alignment: .leading, spacing: 10){
            component1
            
            Divider()
                .padding(.horizontal, -8)
            
            component2
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .roundedRectangleStyle(cornerRadius: 18, backgroundColor: .clear, borderColor: .colorGray, borderWidth: 1.5)
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            header
            
            mainContent
        }
    }
}
