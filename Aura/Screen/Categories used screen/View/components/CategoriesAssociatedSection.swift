//
//  CategoriesAssociatedSection.swift
//  Aura
//
//  Created by Rafael Agayev on 11.06.26.
//

import SwiftUI

struct CategoriesAssociatedSection: View {
    
    @Environment(\.colorScheme) private var colorScheme
    
    private var title: some View{
        Text("Categories associated with you")
            .fontModifier(size: 16, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
    }
    
    private var subtitle: some View{
        Text("Advertisers can reach you based on other categories that we associate with you. You can remove yourself from any of these categories.")
            .fontModifier(size: 16, weight: .medium, foregroundColor: .colorGray)
            .multilineTextAlignment(.leading)
            .lineLimit(3)
    }
    
    private var businessPage: some View{
        HStack{
            Text("Business page admins")
                .fontModifier(size: 16, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            
            Spacer()
            
            Text("Remove")
                .fontModifier(size: 16, weight: .semibold, foregroundColor: .colorGray)
                .padding(.all, 8)
                .roundedRectangleStyle(cornerRadius: 20, backgroundColor: .colorGray.opacity(0.2), borderColor: .clear, borderWidth: 0)
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation{
                        
                    }
                }
        }
    }
    
    private var engagedShoppers: some View{
        HStack{
            Text("Engaged shoppers")
                .fontModifier(size: 16, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            
            Spacer()
            
            Text("Remove")
                .fontModifier(size: 16, weight: .semibold, foregroundColor: .colorGray)
                .padding(.all, 8)
                .roundedRectangleStyle(cornerRadius: 20, backgroundColor: .colorGray.opacity(0.2), borderColor: .clear, borderWidth: 0)
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation{
                        
                    }
                }
        }
    }
    
    private var facebookAccess: some View{
        HStack{
            Text("Facebook access (mobile): Android devices")
                .fontModifier(size: 16, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
                .lineLimit(2)
            
            Spacer()
            
            Text("Remove")
                .fontModifier(size: 16, weight: .semibold, foregroundColor: .colorGray)
                .padding(.all, 8)
                .roundedRectangleStyle(cornerRadius: 20, backgroundColor: .colorGray.opacity(0.2), borderColor: .clear, borderWidth: 0)
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation{
                        
                    }
                }
        }
    }
    
    private var viewAllButton: some View{
        Text("View all")
            .fontModifier(size: 16, weight: .medium, foregroundColor: .colorWhite)
            .padding(.all, 12)
            .frame(maxWidth: .infinity, alignment: .center)
            .roundedRectangleStyle(cornerRadius: 20, backgroundColor: .blueRay, borderColor: .clear, borderWidth: 0)
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation{
                    
                }
            }
    }
    
    private var mainContent: some View{
        VStack(alignment: .leading, spacing: 14){
            businessPage
            
            Divider()
                .padding(.horizontal, -8)
            
            engagedShoppers
            
            Divider()
                .padding(.horizontal, -8)
            
            facebookAccess
            
            Divider()
                .padding(.horizontal, -8)
            
            viewAllButton
        }
        .padding(.all, 14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .roundedRectangleStyle(cornerRadius: 22, backgroundColor: .clear, borderColor: .colorGray, borderWidth: 1.5)
    }
    
    private var header: some View{
        VStack(alignment: .leading, spacing: 4){
            title
            
            subtitle
        }
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 12){
            header
            
            mainContent
        }
    }
}

#Preview {
    CategoriesAssociatedSection()
}
