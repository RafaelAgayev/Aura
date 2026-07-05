//
//  LikesRow.swift
//  Aura
//
//  Created by Rafael Agayev on 06.01.26.
//

import SwiftUI

struct LikesRow: View {
    
    let username: String
    
    let time: String
    
    var onSelect: () -> Void
    
    var isLiked: Bool
    
    var onLiked: () -> Void
    
    var body: some View {
        HStack(spacing: 12) {
            Circle()
                .fill(Color.colorGray.opacity(0.23))
                .frame(width: 40, height: 40)
            VStack(alignment: .leading, spacing: 4){
                Text(username)
                    .fontModifier(size: 18, weight: .medium, foregroundColor: .primary)
                    .onTapGesture {
                        onSelect()
                    }
                
                Text(time)
                    .fontModifier(size: 18, weight: .semibold, foregroundColor: .primary)
            }
            
            Spacer()
            
            Image(systemName: isLiked ? "heart.fill" : "heart")
                .fontModifier(size: 18, weight: .medium, foregroundColor: isLiked ? .red : .colorBlack)
                .scaleEffect(isLiked ? 1.8 : 1.5)
                .animation(.spring(duration: 0.14), value: isLiked)
                .onTapGesture {
                    onLiked()
                }
                
        }
    }
}

