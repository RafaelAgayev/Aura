//
//  CategoriesUsedScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 08.06.26.
//

import SwiftUI

struct CategoriesUsedScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Environment(\.colorScheme) private var colorScheme
    
    
    private var closeButton: some View{
        Image(systemName: "chevron.left")
            .foregroundStyle(colorScheme == .dark ? .colorWhite : .colorBlack)
            .onTapGesture {
                withAnimation{
                    dismiss()
                }
            }
    }
    
    private var headerText: some View{
        Text("Categories used to reach you")
            .fontModifier(size: 22, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
    }
    
    private var accounts: some View{
        (
            Text("Used for 4 accounts comp ")
                .font(.system(size: 18, weight: .medium))
                .foregroundStyle(colorScheme == .dark ? .colorWhite : .colorBlack) +
            Text("View")
                .font(.system(size: 18, weight: .medium))
                .foregroundStyle(.blueRay)
        )
    }
    
    private var chooseProfileInformation: some View{
        VStack(alignment: .leading, spacing: 8) {
            Text("Choose profile information")
                .fontModifier(size: 18, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            
            Text("Choose what profile information is used to help personalize your ads.")
                .fontModifier(size: 16, weight: .medium, foregroundColor: .colorGray)
            
            ChooseProfileInformationSection()
        }
    }
    
    private var editFacebook: some View{
        
        HStack{
            Text("Edit facebook profile")
                .fontModifier(size: 16, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            
            Spacer()
            
            HStack(spacing: 6) {
                
                Image(.iconFacebook)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 18, height: 18)
                
                Image(.iconRightGray)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 12, height: 12)
            }
        }
        .padding(.all, 16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .roundedRectangleStyle(cornerRadius: 20, backgroundColor: .clear, borderColor: .colorGray, borderWidth: 1.5)
    }
    
    private var categoriesAssociated: some View{
        CategoriesAssociatedSection()
    }
    
    private var scrollContent: some View{
        ScrollView{
            VStack(alignment: .leading, spacing: 20) {
                accounts
                
                chooseProfileInformation
                
                editFacebook
                
                categoriesAssociated
            }
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24){
            closeButton
            
            scrollContent
            
        }
        .padding(.top, 35)
        .padding(.horizontal, 12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .navigationBarBackButtonHidden()
        .toolbar(.hidden)
    }
}
