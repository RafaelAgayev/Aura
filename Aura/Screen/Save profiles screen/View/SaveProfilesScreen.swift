//
//  SaveProfilesScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 03.06.26.
//

import SwiftUI

struct SaveProfilesScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Environment(\.showLoading) private var showLoading
    
    @Environment(\.hideLoading) private var hideLoading
    
    @Environment(\.colorScheme) private var colorScheme
    
    private var backButton: some View{
        HStack{
            Image(systemName: "chevron.left")
                .foregroundStyle(colorScheme == .dark ? .colorWhite : .colorBlack)
                .frame(width: 20, height: 20)
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation{
                        dismiss()
                    }
                }
                .padding(.top, 40)
                .padding(.horizontal, 12)
            Spacer()
        }
    }
    
    private var linear: some View{
        HStack(spacing: 0){
            ForEach(0..<5) { index in
                RoundedRectangle(cornerRadius: 4)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .frame(height: 2)
                    .foregroundStyle(index == 0 || index == 1 ? .colorWhite : .colorGray.opacity(0.2))
            }
            .padding(.vertical, 4)
            .padding(.horizontal, 2)
        }
    }
    
    private var img1: some View{
        Image(.thomasShelby)
            .resizable()
            .scaledToFill()
            .frame(width: 50, height: 50)
            .clipShape(Circle())
            .overlay(alignment: .bottomTrailing) {
                Circle()
                    .fill(.colorBlack)
                    .frame(width: 24, height: 24)
                    .overlay {
                        Image(.iconInstagramColored)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 18, height: 18)
                            .clipShape(Circle())
                    }
            }
    }
    
    private var img2: some View{
        Image(.baby)
            .resizable()
            .scaledToFill()
            .clipShape(Circle())
            .frame(width: 50, height: 50)
            .overlay(alignment: .bottomTrailing) {
                Circle()
                    .fill(.colorBlack)
                    .frame(width: 24, height: 24)
                    .overlay {
                        Image(.iconFacebook)
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 18, height: 18)
                    }
            }
    }
    
    private var Images: some View{
        HStack{
            Spacer()
            HStack(spacing: -8){
                img1
                    .zIndex(1)
                
                img2
                    .zIndex(0)
                
            }
            Spacer()
        }
    }
    
    private var header: some View{
        VStack(alignment: .leading, spacing: 8){
            backButton
            
            linear
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            header
            
            Images
            
            Spacer()
        }
        .navigationBarBackButtonHidden()
        .toolbar(.hidden)
    }
}

