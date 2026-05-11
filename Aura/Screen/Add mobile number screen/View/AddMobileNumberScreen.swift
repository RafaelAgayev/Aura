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
    
    @State private var vm: MobileNumberViewModel = .init()
    
    @State private var selectIndex: Set<Int> = []
    
    
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
                .padding(.vertical, 20)
                .padding(.horizontal, 16)
                .roundedRectangleStyle(cornerRadius: 14, backgroundColor: colorScheme == .dark ? .colorWhite.opacity(0.1) : .colorBlack.opacity(0.1), borderColor: .colorGray, borderWidth: 2)
            
            Text("You may receive Whatsapp and SMS notifications from us.")
                .fontModifier(
                    size: 16,
                    weight: .medium,
                    foregroundColor: .colorGray
                )
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
    
    private var socialAccountsHeader: some View{
        VStack(alignment: .leading, spacing: 4){
            Text("Choose accounts for this number")
                .fontModifier(size: 18, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            
            Text("Accounts you choose to add this number to will use it to help you log in and receive notifications from us")
                .fontModifier(size: 14, weight: .medium, foregroundColor: .colorGray)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
        }
    }
    
    private var accounts: some View{
        VStack(alignment: .leading, spacing: 10){
            ForEach(Array(vm.account.enumerated()), id: \.element.id) { index, account in
                HStack(alignment: .top, spacing: 8){
                    Circle()
                        .frame(width: 30, height: 30)
                        .contentShape(Circle())
                        .overlay {
                            Image(account.profilImg)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                        }
                    
                    VStack(alignment: .leading, spacing: 4){
                        Text(account.userName)
                            .fontModifier(size: 14, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
                        
                        Text(account.socialWebName)
                            .fontModifier(size: 14, weight: .medium, foregroundColor: .colorGray)
                        
                        if index == 2 && selectIndex.contains(index){
                            Text("Adding this number will replace +994559562020 on this Instagram account.")
                                .multilineTextAlignment(.leading)
                                .lineLimit(3)
                                .fontModifier(size: 12, weight: .medium, foregroundColor: .red)
                        }
                    }
                    
                   Spacer()
                    
                    VStack{
                        Spacer()
                        RoundedRectangle(cornerRadius: 4)
                            .fill(selectIndex.contains(index) ? .backgroundBlue : .clear)
                            .frame(width: 16, height: 16)
                            .overlay(
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(selectIndex.contains(index) ? .backgroundBlue : .colorGray, lineWidth: 2)
                            )
                            .overlay {
                                if selectIndex.contains(index) {
                                    Image(.checkmark)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 8, height: 8)
                                }
                            }
                            .onTapGesture {
                                if selectIndex.contains(index) {
                                    selectIndex.remove(index)
                                } else {
                                    selectIndex.insert(index)
                                }
                            }
                        Spacer()
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    if selectIndex.contains(index) {
                           selectIndex.remove(index)
                       } else {
                           selectIndex.insert(index)
                       }
                }
                if index != vm.account.count - 1 {
                    Divider()
                        .padding(.horizontal, -8)
                }
                
            }
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .roundedRectangleStyle(cornerRadius: 12, backgroundColor: colorScheme == .dark ? .colorBlack.opacity(0.03) : .colorWhite.opacity(0.03), borderColor: .colorGray, borderWidth: 1.3)
    }
    
    private var nextButton: some View{
        Button{
            
        }label: {
            Text("Next")
                .fontModifier(size: 16, weight: .medium, foregroundColor: .colorWhite)
                .padding(.vertical, 12)
            
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .roundedRectangleStyle(cornerRadius: 18, backgroundColor: .backgroundBlue, borderColor: .clear, borderWidth: 0)
    }
    
    private var socialAccounts: some View{
        VStack(alignment: .leading, spacing: 8){
            socialAccountsHeader
            
            accounts
        }
    }
    
    private var scrollView: some View{
        ScrollView{
            VStack(alignment: .leading, spacing: 16){
                
                closeButton
                
                headerTitle
                
                selectCountry
                
                socialAccounts
                
                Spacer()
                
               
            }
            
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            
            scrollView
            
            nextButton
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

