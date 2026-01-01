//
//  DashBoard.swift
//  Aura
//
//  Created by Rafael Agayev on 23.12.25.
//

import SwiftUI

struct DashBoard: View {
    let title: String
    
    let subtitle: String
    
    let icon: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Image(systemName: icon)
                .fontModifier(size: 28, weight: .medium, foregroundColor: .colorBlue)
            
            Text(title)
                .font(.headline)
                .foregroundStyle(.colorBlack)
            
            Text(subtitle)
                .font(.caption)
                .foregroundStyle(.colorBlack.opacity(0.78))
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 120)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemGray6))
        )
        .shadow(color: .colorBlack.opacity(0.33), radius: 3, x: 0, y: 2)
    }
}

//#Preview {
//    DashBoard()
//}
