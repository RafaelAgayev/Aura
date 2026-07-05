//
//  ActionsViewer.swift
//  Aura
//
//  Created by Rafael Agayev on 05.01.26.
//

import SwiftUI

struct ActionsViewer: View {
//    let icon: String
//    
    let title: LocalizedStringResource
    
    let image: ImageView
    
    
    var body: some View {
        HStack{
            
            image.view
                    .fontModifier(size: 15, weight: .medium, foregroundColor: .primary)
           
            
            Text(title)
                .fontModifier(size: 15, weight: .medium, foregroundColor: .primary)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .fontModifier(size: 14, weight: .medium, foregroundColor: .secondary)
        }
        .contentShape(Rectangle())
    }
}

extension ActionsViewer{
    enum ImageView{
        case icon(String)
        case image(ImageResource)
        
        @ViewBuilder
        var view: some View{
            switch self {
            case .icon(let name):
                Image(systemName: name)
            case .image(let imageResource):
                Image(imageResource)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
            }
        }
    }
}


