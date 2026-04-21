//
//  CreatorScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 21.04.26.
//

import SwiftUI

struct CreatorScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Environment(\.showLoading) private var showLoading
    
    @Environment(\.hideLoading) private var hideLoading
    
    @Environment(\.colorScheme) private var colorScheme
    
    private var icon: some View{
        Circle()
            .fill(colorScheme == .dark ? .colorWhite : .colorBlack.opacity(0.3))
            .frame(width: 60, height: 60)
            .overlay {
                Image(.iconCrown)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
            }
    }
    
    private var title: some View{
        Text("You don't have any active\nsubscriptions.")
            .multilineTextAlignment(.center)
            .lineLimit(2)
            .fontModifier(size: 16, weight: .bold, foregroundColor: .primary)
    }
    
    private var subTitle: some View{
        Text("""
    You haven't subscribed to anyone yet. If\n you subscribe to a creator, your \nsubscription can be managed here
    """)
        .multilineTextAlignment(.center)
        .lineLimit(3)
        .fontModifier(size: 12, weight: .medium, foregroundColor: .primary)
    }
    
    private var learnMoreButton: some View{
        Link("Learn more", destination: URL(string: "https://www.instagram.com")!)
            .tint(.colorAccentOpacity)
    }
    
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 10){
            icon
            title
            subTitle
            
            learnMoreButton
            
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            toolbar
        }
        
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent{
        ToolbarItem(placement: .topBarLeading) {
            Image(systemName: "chevron.left")
                .foregroundStyle(.primary)
                .onTapGesture {
                    dismiss()
                }
        }
        
        ToolbarItem(placement: .principal) {
            Text("Creator subscriptions")
                .fontModifier(size: 14, weight: .semibold, foregroundColor: .primary)
        }
    }
}


