//
//  SaveProfileItemView.swift
//  Aura
//
//  Created by Rafael Agayev on 04.06.26.
//

import SwiftUI

struct SaveProfileItemView: View {
    
    let image: ImageResource
    
    let title: String
    
    var body: some View {
        HStack(spacing: 10) {
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 23, height: 23)
            
            Text(title)
                .fontModifier(size: 14, weight: .medium, foregroundColor: .colorGray)
        }
    }
}
