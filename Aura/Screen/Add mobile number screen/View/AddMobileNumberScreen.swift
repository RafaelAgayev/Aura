//
//  AddMobileNumberScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 10.05.26.
//

import SwiftUI

struct AddMobileNumberScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Environment(\.colorScheme) private var colorScheme
    
    @State private var changeCountry: Bool = false
    
    @State private var number = ""
    
    @State private var selectedCountry: CountryModel = .init(name: "Azerbaijan", code: "+994")
    
    
    
    private var closeButton: some View{
        Image(systemName: "xmark")
            .resizable()
            .scaledToFit()
            .frame(width: 18, height: 18)
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation(.spring(duration: 0.24)){
                    dismiss()
                }
            }
    }
    
    private var headerTitle: some View {
        VStack(alignment: .leading, spacing: 8) {

            Text("Add a mobile number")
                .fontModifier(
                    size: 22,
                    weight: .semibold,
                    foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack
                )

            Text(attributedString)
                .fontModifier(size: 16, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
        }
    }
    
    private var selectCountry: some View{
        VStack(alignment: .leading, spacing: 12){
            HStack{
                Text("\(selectedCountry.name)(\(selectedCountry.code))")
                    .fontModifier(size: 16, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
                
                Spacer()
                
                Text("Change")
                    .fontModifier(size: 16, weight: .semibold, foregroundColor: .backgroundBlue)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        withAnimation{
                            changeCountry = true
                        }
                    }
            }
            
            TextField("Enter mobile number", text: $number)
                .fontModifier(size: 14, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
                .keyboardType(.numberPad)
                .padding(.vertical, 16)
                .padding(.horizontal, 10)
                .roundedRectangleStyle(cornerRadius: 14, backgroundColor: colorScheme == .dark ? .colorWhite.opacity(0.1) : .colorBlack.opacity(0.1), borderColor: .colorGray, borderWidth: 2)
        }
    }
    
    private var attributedString: AttributedString{
        var text = AttributedString(
            "We'll use this number across all of your accounts in Accounts Center to personalize experiences, like connecting people and improving ads on our products. "
            )
        
        var learnMore = AttributedString("Learn more")
        learnMore.link = URL(string: "https://wwww.linkedin.com/rafaelagayev")
        learnMore.foregroundColor = .backgroundBlue
        text.append(learnMore)
        
        return text
    }
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 12){
                
                closeButton
                
                headerTitle
                
                selectCountry
            }
        }
        .sheet(isPresented: $changeCountry) {
            SelectCountryScreen(selectCountry: $selectedCountry)
                .presentationCornerRadius(24)
                .interactiveDismissDisabled(true)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 24)
        .padding(.horizontal, 12)
    }
}

