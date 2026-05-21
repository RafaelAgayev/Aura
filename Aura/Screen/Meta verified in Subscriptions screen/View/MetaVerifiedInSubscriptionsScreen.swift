//
//  MetaVerifiedInSubscriptionsScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 21.05.26.
//

import SwiftUI

struct MetaVerifiedInSubscriptionsScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Environment(\.colorScheme) private var colorScheme
    
    @Environment(\.showLoading) private var showLoading
    
    @Environment(\.hideLoading) private var hideLoading
    
    @StateObject private var vm: MetaVerifiedSubscriptionsViewModel = .init()
    
    private var linear: some View{
        HStack(spacing: 0) {
            ForEach(0..<5){ index in
                RoundedRectangle(cornerRadius: 4)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .frame(height: 2)
                    .foregroundStyle(index == 0 ? .colorWhite : .colorGray.opacity(0.5))
            }
            .padding(.horizontal, 4)
            .padding(.top, 6)
        }
    }
    
    private var imageAndName: some View{
        VStack(alignment: .center, spacing: 6){
            Image(.thomasShelby)
                .resizable()
                .scaledToFill()
                
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .overlay(alignment: .bottomTrailing) {
                    Image(.iconInstagramColored)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15, height: 15)
                        .padding(2)
                        
                }
            HStack(spacing: 3){
                Text("r.a_rus")
                    .fontModifier(size: 14, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
                
                Image(.metaVerified)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 15, height: 15)
            }
        }
    }
    
    private var firstMonth: some View {
        Text("Starting at just $0.49 for your first month")
            .fontModifier(size: 22, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            .multilineTextAlignment(.leading)
            .lineLimit(2)
            .padding(.horizontal, 12)
    }
    
    private var standartPackage: some View{
       StandartTab()
    }
    
    private var verifiedBadge: some View{
        HStack(spacing: 10) {
            HStack(spacing: -12) {
                Image(.girl1)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipShape(Circle())
                
                Image(.boy3)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipShape(Circle())
                
                Image(.boy11)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipShape(Circle())
            }
            
            Text("Tomiris, Adam and Figma already have a verified badge")
                .fontModifier(size: 12, weight: .medium, foregroundColor: .colorGray)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var body: some View {
        VStack(spacing: 12){
            
            linear
            ScrollView{
                
                VStack(alignment: .center, spacing: 16){
                    firstMonth
                    
                    imageAndName
                    
                    verifiedBadge
                    
                    standartPackage
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 8)
        .navigationBarBackButtonHidden()
        .toolbar {
            toolbar
        }
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent{
        ToolbarItem(placement: .topBarLeading) {
            Image(systemName: "chevron.left")
                .foregroundStyle(colorScheme == .dark ? .colorWhite : .colorBlack)
                .onTapGesture {
                    withAnimation{
                        dismiss()
                    }
                }
        }
        
        ToolbarItem(placement: .principal) {
            HStack(spacing: 6) {
                Image(.iconMetaLogo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                
                Text("Meta")
                    .fontModifier(size: 16, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            }
        }
    }
}


