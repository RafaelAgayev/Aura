//
//  SelectCountryScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 10.05.26.
//

import SwiftUI

struct SelectCountryScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Environment(\.colorScheme) private var colorScheme
    
    @Binding var selectCountry: CountryModel
    
    @StateObject private var vm: CountryViewModel = .init()
    
    private var closeButton: some View{
        Image(systemName: "xmark")
            .resizable()
            .scaledToFit()
            .frame(width: 18, height: 18)
            .foregroundStyle(colorScheme == .dark ? .colorWhite : .colorBlack)
            .onTapGesture {
                withAnimation{
                    dismiss()
                }
            }
    }
    
    private var listSection: some View{
        ScrollView{
            ForEach(Array(vm.country.enumerated()), id: \.element.id){ index, country in
                HStack{
                    LazyVStack(alignment: .leading, spacing: 10){
                        Text(country.name)
                            .fontModifier(size: 14, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
                        
                        Text(country.code)
                            .fontModifier(size: 14, weight: .medium, foregroundColor: .colorGray)
                        
                        
                    }
                    Spacer()
                    
                    Circle()
                       
                        .stroke(.backgroundBlue, lineWidth: 2)
                        .frame(width: 18, height: 18)
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation{
                        selectCountry = country
                        dismiss()
                    }
                }
                
                if index != vm.country.count - 1 {
                    Divider()
                        .padding(.horizontal, -10)
                }
            }
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
        .roundedRectangleStyle(cornerRadius: 18, backgroundColor: colorScheme == .dark ? .colorBlack.opacity(0.1) : .colorWhite.opacity(0.1), borderColor: .colorGray, borderWidth: 1.5)
    }
    
    private var title: some View{
        Text("Select Country")
            .fontModifier(size: 22, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
    }
    
    private var header: some View{
        HStack{
            
            closeButton
            Spacer()
            
            title
            
            Spacer()
        }
    }
    var body: some View {
        
        VStack(alignment: .leading, spacing: 12){
            header
            
            listSection
            
            Spacer()
        }
        .padding(.top, 20)
        .padding(.horizontal, 12)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}


