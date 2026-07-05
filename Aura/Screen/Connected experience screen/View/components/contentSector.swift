//
//  contentSector.swift
//  Aura
//
//  Created by Rafael Agayev on 28.06.26.
//

import SwiftUI

struct contentSector: View {
    
    let image: ImageResource
    
    let title: String
    
    @Environment(\.colorScheme) private var colorScheme
    
    var onTap : (ConnectedExperienceScreen.Route?) -> Void
    
//    @State private var tapped: ConnectedExperienceScreen.Route? = nil
    
    var body: some View {
        cross()
    }
    
    private func cross() -> some View{
        HStack(alignment: .center, spacing: 12){
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 22, height: 22)
            
            Text(title)
                .fontModifier(size: 16, weight: .medium, foregroundColor:  colorScheme == .dark ? .colorWhite : .colorBlack)
            
            Spacer()
            
            Image(.iconRightGray)
                .resizable()
                .scaledToFill()
                .frame(width: 14, height: 14)
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .contentShape(Rectangle())
        .onTapGesture {
            onTap(nil)
        }
    }
}

