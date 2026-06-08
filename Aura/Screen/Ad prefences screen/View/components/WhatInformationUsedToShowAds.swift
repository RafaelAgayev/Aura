//
//  WhatInformationUsedToShowAds.swift
//  Aura
//
//  Created by Rafael Agayev on 07.06.26.
//

import SwiftUI

struct WhatInformationUsedToShowAds: View {
    
    @Environment(\.colorScheme) private var colorScheme
    
    var onTap: (AdPrefencesScreen.Route) -> Void
    
    private var header: some View{
        Text("What information is used to show me ads?")
            .fontModifier(size: 18, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
    }
    
    private var subTitle: some View{
        Text("We show you ads based on your information and activity. You get to control these settings.")
            .fontModifier(size: 18, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            .multilineTextAlignment(.leading)
            .lineLimit(3)
    }
    
    private var moreDetailsButton: some View{
        Button{
            onTap(.whatInformationAds)
        }label: {
            Text("More details")
                .fontModifier(size: 18, weight: .medium, foregroundColor: .colorWhite)
                .padding(.vertical, 10)
                .padding(.horizontal, 6)
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .roundedRectangleStyle(cornerRadius: 18, backgroundColor: .blueRay, borderColor: .clear, borderWidth: 0)
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 12){
            header
            
            subTitle
            
            Spacer()
            
            moreDetailsButton
        }
        .frame(maxHeight: 250)
        .padding(.all, 18)
        .frame(maxWidth: .infinity, alignment: .leading)
        .roundedRectangleStyle(cornerRadius: 22, backgroundColor: .clear, borderColor: .colorGray, borderWidth: 1.5)
    }
}


