//
//  TravelDetailsSection.swift
//  Aura
//
//  Created by Rafael Agayev on 17.01.26.
//

import SwiftUI

struct TravelDetailsSection: View {
    let travel: TravelModel
    
    @State private var showFullScreen = false
    
    var body: some View {
        
       
            VStack(alignment: .center, spacing: 12){
                if let img = travel.image{
                    Image(img)
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity)
                        .frame(width: 400)
                        
                        .roundedCorners(cornerRadius: 12)
                        .onTapGesture{
                           showFullScreen = true
                        }
                        .fullScreenCover(isPresented: $showFullScreen) {
                            FullScreenImageView(image: img)
                        }
                }
                VStack(alignment: .leading, spacing: 8){
                    HStack(alignment: .center, spacing: 5){
                        Text(travel.title)
                            .fontModifier(size: 12, weight: .semibold, foregroundColor: .colorBlack)
                            .lineLimit(1)
                        
                        Text("Rank: ⭐️ \( travel.rank)")
                            .fontModifier(size: 12, weight: .semibold, foregroundColor: .colorBlack)
                        
                        Text("Like this: ❤️‍🔥 \(travel.liked, default: "%1.f")")
                            .fontModifier(size: 12, weight: .semibold, foregroundColor: .colorBlack)
                    }
                    Text("Description: \(travel.description)")
                        .fontModifier(size: 10, weight: .semibold, foregroundColor: .colorGray)
                   
                }
                .padding(.horizontal)
                .padding(.vertical, 6)
            }
        
    }
}

