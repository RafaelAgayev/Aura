//
//  UnlockBenefitsScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 02.06.26.
//

import SwiftUI

struct UnlockBenefitsScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Environment(\.colorScheme) private var colorScheme
    
    @Environment(\.showLoading) private var showLoading
    
    @Environment(\.hideLoading) private var hideLoading
    
    @State private var route: Route? = nil
    
    private var linear: some View{
        HStack(spacing: 0) {
            ForEach(0..<5){ index in
                RoundedRectangle(cornerRadius: 4)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .frame(height: 2)
                    .foregroundStyle(index == 0 ? .colorWhite : .colorGray.opacity(0.5))
            }
            .padding(.vertical, 4)
            .padding(.horizontal, 2)
        }
    }
    
    private var headerTitle: some View{
        VStack(alignment: .leading, spacing: 4){
            Text("Show you're verified")
                .fontModifier(size: 19, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            
            Text("everywhere")
                .fontModifier(size: 19, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
        }
    }
    
    private var headerSubtitle: some View{
        VStack(alignment: .leading, spacing: 4){
            Text("Profiles that are Meta Verified get more")
                .fontModifier(size: 14, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            
            Text("engagement on average.")
                .fontModifier(size: 14, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
        }
    }
    
    
    private var images: some View {
        ZStack {
            Image(.baby)
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 24, height: 24)
                .offset(x: 8, y: -8)
            
            Image(.thomasShelby)
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 20, height: 20)
        }
        .frame(width: 20, height: 20)
    }

    
    private var content1: some View{
        VStack(alignment: .leading, spacing: 8){
            HStack(alignment: .center, spacing: 22){
                images
                
                VStack(alignment: .leading, spacing: 4){
                    HStack(spacing: 2) {
                        Text("r.a_rus & Rafa El")
                            .fontModifier(size: 14, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
                        
                        Image(.metaVerified)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 14, height: 14)
                    }
                    
                    Text("Instagram and connected Facebook")
                        .fontModifier(size: 14, weight: .medium, foregroundColor: .colorGray)
                }
            }
            
            saveButton
        }
    }
    
    private var saveButton: some View{
        Button{
            route = .save
        }label: {
            Text("Save 20% on profiles")
                .fontModifier(size: 16, weight: .semibold, foregroundColor: .colorGray)
                .padding(.vertical, 8)
                .padding(.horizontal, 4)
                .frame(maxWidth: .infinity, alignment: .center)
        }
        .roundedRectangleStyle(cornerRadius: 18, backgroundColor: .colorGray.opacity(0.1), borderColor: .clear, borderWidth: 0)
    }
    
    private var continueWithOneProfileButton: some View{
        Button{
            route = .continueOneProfile
        }label: {
            Text("Continue with one profile")
                .fontModifier(size: 16, weight: .semibold, foregroundColor: .colorGray)
                .padding(.vertical, 8)
                .padding(.horizontal, 4)
                .frame(maxWidth: .infinity, alignment: .center)
        }
        .roundedRectangleStyle(cornerRadius: 18, backgroundColor: .colorGray.opacity(0.1), borderColor: .clear, borderWidth: 0)
    }
    
    private var content2Img: some View{
        Image(.thomasShelby)
            .resizable()
            .scaledToFill()
            .clipShape(Circle())
            .frame(width: 32, height: 32)
            .overlay(alignment: .bottomTrailing) {
                Circle()
                    .fill(.colorBlack)
                    .frame(width: 18, height: 18)
                    .overlay {
                        Image(.iconInstagramColored)
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 15, height: 15)
                    }
            }
    }
    
    private var content2: some View{
        VStack(alignment: .leading, spacing: 12){
            HStack(alignment: .center, spacing: 16){
                content2Img
                
                HStack(spacing: 6) {
                    Text("r.a_rus")
                        .fontModifier(size: 14, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
                    
                    Image(.metaVerified)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 18, height: 18)
                }
            }
            
           continueWithOneProfileButton
        }
    }
    
    private var header: some View{
        VStack(alignment: .leading, spacing: 12){
            headerTitle
            
            headerSubtitle
        }
    }
    
    private var mainContent: some View{
        VStack(alignment: .leading, spacing: 12){
            content1
            
            Divider()
                .padding(.horizontal, -8)
            
            content2
        }
        .padding(.vertical, 14)
        .padding(.horizontal, 12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .roundedRectangleStyle(cornerRadius: 14, backgroundColor: .clear, borderColor: .colorGray, borderWidth: 1.5)
    }
    
    private var someProfiles: some View{
        HStack(spacing: 3) {
            Text("Meta Verified is only available for")
                .fontModifier(size: 14, weight: .medium, foregroundColor: .colorGray)
            
            someProfilesButton
        }
    }
    
    private var someProfilesButton: some View{
        HStack(spacing: 0){
            if let url = URL(string: "https://www.linkedin.com/in/rafael"){
                Link("some profiles", destination: url)
                    .fontModifier(size: 14, weight: .medium, foregroundColor: .backgroundBlue)
            }
            
            Text(".")
                .fontModifier(size: 14, weight: .medium, foregroundColor: .colorGray)
        }
    }
    
    private var scrollContent: some View{
        ScrollView{
            VStack(alignment: .leading, spacing: 24){
                
                header
                
                mainContent
                
                someProfiles
            }
        }
        .padding(.horizontal, 18)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12){
            linear
            
           scrollContent
            
           
        }
        .navigationDestination(item: $route) { navigation in
            switch navigation{
            case .save:
                SaveProfilesScreen()
                
            case .continueOneProfile:
                EmptyView()
            }
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
                .foregroundStyle(colorScheme == .dark ? .colorWhite : .colorBlack)
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation{
                        dismiss()
                    }
                }
        }
    }
}

extension UnlockBenefitsScreen{
    enum Route: Identifiable{
        var id: Self { self }
        
        case save, continueOneProfile
    }
}
