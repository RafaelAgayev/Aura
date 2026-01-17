//
//  FullScreenImageView.swift
//  Aura
//
//  Created by Rafael Agayev on 17.01.26.
//

import SwiftUI

struct FullScreenImageView: View {
    
    let image: ImageResource
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var isZoomed = false
    
    var body: some View {
        
        ZStack{
            Color.black
                .blur(radius: 0.8)
                .opacity(0.3)
                .ignoresSafeArea()
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
                .scaleEffect(isZoomed ? 2.0 : 1.0)
                .onTapGesture(count: 2) {
                    withAnimation(.spring(response: 0.35, dampingFraction: 0.8)){
                        isZoomed.toggle()
                    }
                }
            
            VStack{
                HStack{
                    Spacer()
                    Button{
                        dismiss()
                    }label: {
                        Image(systemName: "xmark.circle.fill")
                            .fontModifier(size: 20, weight: .medium, foregroundColor: .colorWhite)
                            .padding()
                    }
                }
                Spacer()
            }
            
        }
        
        
    }
}

