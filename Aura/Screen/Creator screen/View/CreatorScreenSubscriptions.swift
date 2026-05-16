//
//  CreatorScreenSubscriptions.swift
//  Aura
//
//  Created by Rafael Agayev on 12.05.26.
//

import SwiftUI

struct CreatorScreenSubscriptions: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Environment(\.colorScheme) private var colorScheme
    
    @State private var navigation = false
    
    private var icon: some View{
        Image(.creators)
            .resizable()
            .scaledToFit()
            .frame(width: 90, height: 90)
    }
    
    private var header: some View{
        Text("Creators")
            .fontModifier(size: 20, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
    }
    
    private var title: some View{
        Text("Support your favorite creators")
            .fontModifier(size: 16, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            .multilineTextAlignment(.center)
    }
    
    private var subtitle: some View{
        Text("Unlock access to exclusive benefits creators may offer")
            .multilineTextAlignment(.center)
            .lineLimit(2)
            .fontModifier(size: 14, weight: .medium, foregroundColor: .colorGray)
    }
    
    private var findCreators: some View{
        FindCreatorsSection(
            image: .iconInstagramColored,
            title: "Find Instagram creators",
            subtitle: "Find and follow popular accounts", onTap: { navigation = true})
    }
    
    private var headerAndIcon: some View{
        VStack(alignment: .center, spacing: 8){
            icon
            
            header
            
            title
            
            subtitle
        }
    }
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 32){
            headerAndIcon
            
            findCreators
            
            Spacer()
        }
        .padding(.horizontal, 12)
        .navigationBarBackButtonHidden()
        .navigationDestination(isPresented: $navigation){
            InstagramCreatorsScreen()
        }
        .toolbar {
            toolbar
        }
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent{
        ToolbarItem(placement: .topBarLeading) {
            Button{
                withAnimation(.spring){
                    dismiss()
                }
            }label: {
                Image(systemName: "chevron.left")
                    .foregroundStyle(colorScheme == .dark ? .colorWhite : .colorBlack)
            }
        }
    }
}
