//
//  MusicSection.swift
//  Aura
//
//  Created by Rafael Agayev on 20.01.26.
//

import SwiftUI

struct MusicSection: View {
    
    let music: MusicModel
    
    var body: some View {
        
        HStack(spacing: 8) {
            if let img = music.image{
                Image(img)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 100)
                    .roundedCorners(cornerRadius: 12)
            }
            
            Text(music.artist)
                .fontModifier(size: 18, weight: .semibold, foregroundColor: .colorBlack)
            
            Text("- \(music.songName)")
                .fontModifier(size: 15, weight: .medium, foregroundColor: .colorBlack)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

