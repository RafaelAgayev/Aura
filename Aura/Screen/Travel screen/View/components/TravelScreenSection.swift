//
//  TravelScreenSection.swift
//  Aura
//
//  Created by Rafael Agayev on 15.01.26.
//

import SwiftUI

struct TravelScreenSection: View {
    
    let travel: TravelModel
    
    var body: some View {
        HStack(spacing: 5){
            if let img = travel.image{
                Image(img)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 100)
                    .roundedCorners(cornerRadius: 8)
                
                VStack(alignment: .leading, spacing: 5){
                    Text(travel.title)
                        .fontModifier(size: 18, weight: .semibold, foregroundColor: .colorBlack)
                    
                    Text("★ \(travel.rank)")
                        .fontModifier(size: 15, weight: .semibold, foregroundColor: .colorBlack)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
        .padding(.vertical, 6)
    }
}
