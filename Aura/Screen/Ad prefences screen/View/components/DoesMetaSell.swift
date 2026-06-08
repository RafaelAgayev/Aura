//
//  DoesMetaSell.swift
//  Aura
//
//  Created by Rafael Agayev on 07.06.26.
//

import SwiftUI

struct DoesMetaSell: View {
    
    @Environment(\.colorScheme) private var colorScheme
    
    var onTap: (AdPrefencesScreen.Route) -> Void
    
    private var header: some View{
        Text("Does Meta sell my information?")
            .fontModifier(size: 18, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
    }
    
    private var subtitle: some View{
        Text("No. We never sell your information")
            .fontModifier(size: 18, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
    }
    
    private var moreDetailsButton: some View{
        Button{
            onTap(.doesMetaSell)
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
            
            subtitle
            
            Spacer()
            
            moreDetailsButton
        }
        .padding(.all, 18)
        .frame(maxWidth: .infinity, alignment: .leading)
        .roundedRectangleStyle(cornerRadius: 22, backgroundColor: .clear, borderColor: .colorGray, borderWidth: 1.5)
    }
}
