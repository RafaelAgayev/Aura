//
//  ChooseProfileInformationSection.swift
//  Aura
//
//  Created by Rafael Agayev on 11.06.26.
//

import SwiftUI

struct ChooseProfileInformationSection: View {
    
    @Environment(\.colorScheme) private var colorScheme
    
    private var yeloBank: some View{
        HStack(alignment: .center){
            VStack(alignment: .leading, spacing: 4){
                Text("Yelo Bank")
                    .fontModifier(size: 16, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
                
                Text("Employer")
                    .fontModifier(size: 16, weight: .medium, foregroundColor: .colorGray)
            }
            
            Spacer()
            
            HStack(spacing: 6){
                Text("Used")
                    .fontModifier(size: 14, weight: .medium, foregroundColor: .colorGray)
                
                Image(.iconRightGray)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 12, height: 12)
            }
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation{
                    
                }
            }
        }
    }
    
    private var jobTitle: some View{
        HStack{
            Text("Job title")
                .fontModifier(size: 16, weight: .medium, foregroundColor: .colorGray)
            
            Spacer()
            
            HStack(spacing: 6){
                Text("Used")
                    .fontModifier(size: 14, weight: .medium, foregroundColor: .colorGray)
                
                Image(.iconRightGray)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 12, height: 12)
            }
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation{
                    
                }
            }
        }
    }
    
    private var education: some View{
        HStack{
            Text("Education")
                .fontModifier(size: 16, weight: .medium, foregroundColor: .colorGray)
            
            
            Spacer()
            
            HStack(spacing: 6){
                Text("Used")
                    .fontModifier(size: 14, weight: .medium, foregroundColor: .colorGray)
                
                Image(.iconRightGray)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 12, height: 12)
            }
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation{
                    
                }
            }
        }
    }
    
    private var unspecified: some View{
        HStack{
            VStack(alignment: .leading, spacing: 2) {
                Text("Unspecified")
                    .fontModifier(size: 14, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
                
                Text("Relationship status")
                    .fontModifier(size: 14, weight: .medium, foregroundColor: .colorGray)
            }
            
            Spacer()
            
            HStack(spacing: 6){
                Text("Used")
                    .fontModifier(size: 14, weight: .medium, foregroundColor: .colorGray)
                
                Image(.iconRightGray)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 12, height: 12)
            }
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation{
                    
                }
            }
        }
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            yeloBank
            
            Divider()
                .padding(.horizontal, -8)
            
            jobTitle
            
            Divider()
                .padding(.horizontal, -8)
            
            education
            
            Divider()
                .padding(.horizontal, -8)
            
            unspecified
            
            
        }
        .padding(.all, 14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .roundedRectangleStyle(cornerRadius: 20, backgroundColor: .clear, borderColor: .colorGray, borderWidth: 1.5)
    }
}
