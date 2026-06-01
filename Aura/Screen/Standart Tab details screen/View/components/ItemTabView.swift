//
//  ItemTabView.swift
//  Aura
//
//  Created by Rafael Agayev on 29.05.26.
//

import SwiftUI

struct ItemTabView: View {
    
    let image: ImageResource
    
    let title: String
    
    let description: String
    
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
       
            HStack(alignment: .top, spacing: 10) {
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 16, height: 16)
                
                VStack(alignment: .leading, spacing: 4){
                    Text(title)
                        .fontModifier(size: 16, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
                    
                    Text(description)
                        .fontModifier(size: 14, weight: .medium, foregroundColor: .colorGray)
                }
        }
    }
}
