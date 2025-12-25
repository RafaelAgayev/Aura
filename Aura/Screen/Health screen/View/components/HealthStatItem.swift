//
//  HealthStatItem.swift
//  Aura
//
//  Created by Rafael Agayev on 25.12.25.
//

import SwiftUI

struct HealthStatItem: View {
    
    let stat: HealthStat
    
    @State var isSelected: Bool
    
    var body: some View {
        VStack(spacing: 6){
            Text(stat.emoji)
                .font(.headline)
            
            Text(stat.title)
                .font(.subheadline)
                .fontWeight(.semibold)
            
            Text(stat.value)
                .font(.subheadline)
                .fontWeight(.medium)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(isSelected ? Color.primary.opacity(0.1) : Color(.systemGray6))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 14)
                .stroke(isSelected ? Color.primary : .clear, lineWidth: 1.5)
        )
    }
}

