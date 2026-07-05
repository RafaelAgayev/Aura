//
//  MetaVerifiedStandartBundle.swift
//  Aura
//
//  Created by Rafael Agayev on 05.06.26.
//

import SwiftUI

struct MetaVerifiedStandartBundle: View {
    
    @Environment(\.colorScheme) private var colorScheme
    
    @Environment(\.dismiss) private var dismiss
    
    @Environment(\.showLoading) private var showLoading
    
    @Environment(\.hideLoading) private var hideLoading
    
    private var headerTitle: some View{
        Text("App Store")
            .fontModifier(size: 24, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
    }
    
    private var closeButton: some View{
        Circle()
            .fill(.colorGray.opacity(0.5))
            .frame(width: 30, height: 30)
            .overlay {
                Image(systemName: "xmark")
                    .foregroundStyle(colorScheme == .dark ? .colorWhite : .colorBlack)
            }
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation{
                    dismiss()
                }
            }
    }
    
    
    
    private var header: some View{
        HStack{
            headerTitle
            
            Spacer()
            
            closeButton
        }
        .padding(.top, 20)
    }
    
    
    private var topContent: some View{
        HStack(alignment: .center, spacing: 12){
            Image(.iconInstagramColored)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
            
            VStack(alignment: .leading, spacing: 0){
                Text("Meta Verified Standart Bundle")
                    .fontModifier(size: 14, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
                
                Text("USD 12.49/month")
                    .fontModifier(size: 13, weight: .medium, foregroundColor: .colorGray)
                
                Text("Starting 5 Jul 2026")
                    .fontModifier(size: 13, weight: .medium, foregroundColor: .colorGray)
            }
        }
    }
    
    private var middleContent: some View{
        VStack(alignment: .leading, spacing: 10){
            VStack(alignment: .leading, spacing: 0){
                Text("Meta Verified Standart Bundle")
                    .fontModifier(size: 12, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
                
                Text("USD 0.79 for 1 month")
                    .fontModifier(size: 12, weight: .semibold, foregroundColor: colorScheme == .dark  ? .colorWhite : .colorBlack)
                
                Text("Starting on 5 Jun 2026")
                    .fontModifier(size: 12, weight: .medium, foregroundColor: .colorGray)
            }
            
            VStack(alignment: .leading, spacing: 0){
                Text("USD 12.49 every month")
                    .fontModifier(size: 12, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
                
                Text("Starting on 5 Jul 2026")
                    .fontModifier(size: 12, weight: .medium, foregroundColor: .colorGray)
            }
            
            Text("Pro-rata charges may apply until 5 Jul 2026")
                .fontModifier(size: 12, weight: .medium, foregroundColor: .colorGray)
        }
    }
    
    private var bottomContent: some View{
        VStack(alignment: .leading, spacing: 12){
            Text("Cancel at any time in Settings > Apple Account at least one day before each renewal date. Plan automatically renews until cancelled.")
                .fontModifier(size: 12, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            
            Divider()
            
            Text("Account: rafael.agayev141@gmail.com")
                .tint(.colorGray)
                .fontModifier(size: 12, weight: .medium, foregroundColor: .colorGray)
        }
    }
    
    private var mainContent: some View{
        VStack(alignment: .leading, spacing: 12){
            topContent
            
            Divider()
               
            
            middleContent
            
            Divider()
             
            
            bottomContent
        }
        .padding(.vertical, 14)
        .padding(.horizontal, 12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .roundedRectangleStyle(cornerRadius: 14, backgroundColor: .colorGray.opacity(0.1), borderColor: .clear, borderWidth: 0)
    }
    
    private var acceptButton: some View{
        HStack{
            Spacer()
            
            Button{
                
            }label: {
                Text("Accept")
                    .fontModifier(size: 18, weight: .medium, foregroundColor: .colorWhite)
                    .padding(.horizontal, 4)
            }
            .padding(.vertical, 24)
            .frame(width: 140, height: 40)
            .roundedRectangleStyle(cornerRadius: 18, backgroundColor: .blueRay, borderColor: .clear, borderWidth: 0)
          Spacer()
        }
    }
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 18){
            header
            
            mainContent
            
            acceptButton
            Spacer()
        }
        .padding(.horizontal, 18)
    }
}


