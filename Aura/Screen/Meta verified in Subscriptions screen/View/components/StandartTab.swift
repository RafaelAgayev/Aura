//
//  StandartTab.swift
//  Aura
//
//  Created by Rafael Agayev on 21.05.26.
//

import SwiftUI

struct StandartTab: View {
    
    @Environment(\.colorScheme) private var colorScheme
    
    @State private var animateBorder = false
    
    var onTap: () -> Void
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 12){
            Text("Standart")
                .fontModifier(size: 18, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            
            HStack(spacing: 2) {
                Text("$0.49 for your first month")
                    .fontModifier(size: 12, weight: .medium, foregroundColor: .colorGreenWhatsapp)
                
                Text("$7.69/month per profile")
                    .strikethrough(true)
                    .fontModifier(size: 12, weight: .medium, foregroundColor: .colorGray)
            }
            .multilineTextAlignment(.leading)
            .lineLimit(2)
            
            HStack(spacing: 2) {
                Image(.info)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 14, height: 14)
                
                Text("Trial benefit.")
                    .fontModifier(size: 12, weight: .medium, foregroundColor: .colorGray)
                
                Link("Learn more", destination: URL(string: "www.google.com")!)
                    .fontModifier(size: 12, weight: .medium, foregroundColor: .backgroundBlue)
            }
            
            Text("Recommended")
                .fontModifier(size: 12, weight: .medium, foregroundColor: .colorWhite)
                .padding(.vertical, 4)
                .padding(.horizontal, 6)
                .roundedRectangleStyle(cornerRadius: 12, backgroundColor: .backgroundBlue, borderColor: .clear, borderWidth: 0)
            
            Divider()
            
            HStack(spacing: 8) {
                Image(.metaVerified)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)
                
                Text("Verified badge")
                    .fontModifier(size: 14, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            }
            
            Text("Maximize discovery")
                .fontModifier(size: 14, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            
            HStack(spacing: 6) {
                Image(systemName: "checkmark")
                    .foregroundStyle(colorScheme == .dark ? .colorWhite : .colorBlack)
                
                Text("Search optimization")
                    .fontModifier(size: 14, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            }
            
            Text("Drive engagement")
                .fontModifier(size: 14, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            
            HStack(spacing: 6) {
                Image(systemName: "checkmark")
                    .foregroundStyle(colorScheme == .dark ? .colorWhite : .colorBlack)
                
                Text("Upgrade profile links")
                    .fontModifier(size: 14, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
                
            }
            
            HStack(spacing: 6) {
                Image(systemName: "checkmark")
                    .foregroundStyle(colorScheme == .dark ? .colorWhite : .colorBlack)
                
                Text("Exclusive stickers")
                    .fontModifier(size: 14, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
                
            }
            
            Text("Protect your brand")
                .fontModifier(size: 14, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            
            HStack(spacing: 6) {
                Image(systemName: "checkmark")
                    .foregroundStyle(colorScheme == .dark ? .colorWhite : .colorBlack)
                
                Text("Impersonation protection")
                    .fontModifier(size: 14, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
                
            }
            
            HStack(alignment: .center, spacing: 6) {
                Image(systemName: "checkmark")
                    .foregroundStyle(colorScheme == .dark ? .colorWhite : .colorBlack)
                
                VStack(alignment: .leading, spacing: 4){
                    Text("Exclusive stickers")
                        .fontModifier(size: 14, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
                    
                    Text("Chat or email with agents")
                        .fontModifier(size: 14, weight: .medium, foregroundColor: .colorGreen)
                }
            }
            
            HStack(spacing: 6) {
                Image(systemName: "xmark")
                    .foregroundStyle(.colorGray)

                Text("Featured profile")
                    .fontModifier(size: 14, weight: .medium, foregroundColor: .colorGray)

            }
            
            HStack(spacing: 6) {
                Image(systemName: "xmark")
                    .foregroundStyle(.colorGray)

                Text("Add links to Reels")
                    .fontModifier(size: 14, weight: .medium, foregroundColor: .colorGray)

            }
            
            HStack(spacing: 6) {
                Image(systemName: "xmark")
                    .foregroundStyle(.colorGray)

                Text("Competitive insights")
                    .fontModifier(size: 14, weight: .medium, foregroundColor: .colorGray)

            }
            
            HStack(spacing: 6) {
                Image(systemName: "xmark")
                    .foregroundStyle(.colorGray)

                Text("Custom chat themes")
                    .fontModifier(size: 14, weight: .medium, foregroundColor: .colorGray)

            }
            
            Button{
                withAnimation{
                    onTap()
                }
            }label: {
                Text("See benefit details")
                    .fontModifier(size: 16, weight: .medium, foregroundColor: .backgroundBlue)
            }
            
            .padding(.horizontal, 10)
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(.colorGray, lineWidth: 1.5)
        }

        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(
                    AngularGradient(
                        colors: [
                            .clear,
                            .clear,
                            .blue,
                            .purple,
                            .pink,
                            .clear,
                            .clear
                        ],
                        center: .center,
                        angle: .degrees(animateBorder ? 360 : 0)
                    ),
                    lineWidth: 3
                )
                .animation(
                    .linear(duration: 3)
                        .repeatForever(autoreverses: false),
                    value: animateBorder
                )
        }
        .onAppear {
            animateBorder = true
        }
    }
}

