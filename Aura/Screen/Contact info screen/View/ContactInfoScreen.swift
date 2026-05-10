//
//  ContactInfoScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 10.05.26.
//

import SwiftUI

struct ContactInfoScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Environment(\.colorScheme) private var colorScheme
    
    @State private var showAddContact = false
    
    @State private var navigation: Navigation? = nil
    
    private var headerTitle: some View{
        VStack(alignment: .leading, spacing: 6){
            Text("Contact Information")
                .fontModifier(size: 24, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            
            Text("Manage your mobile numbers and emails, and who can see your contact info. Use any of them to access any profiles or devices in this Accounts Center.")
                .fontModifier(size: 16, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
                .lineLimit(4)
                .multilineTextAlignment(.leading)
        }
    }
    
    private var addNewContact: some View{
        VStack(alignment: .center, spacing: 8) {
            Divider()
                .padding(.horizontal, -6)
            
            Button{
                withAnimation(.spring){
                    showAddContact = true
                }
            }label: {
                Text("Add new contact")
                    .fontModifier(size: 14, weight: .medium, foregroundColor: .colorWhite)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.vertical, 12)
                    .roundedRectangleStyle(cornerRadius: 22, backgroundColor: .backgroundBlue, borderColor: .clear, borderWidth: 0)
            }
        }
    }
    
    private var backButton: some View{
        Image(systemName: "chevron.left")
            .resizable()
            .scaledToFit()
            .frame(width: 18, height: 18)
            .foregroundStyle(colorScheme == .dark ? .colorWhite : .colorBlack)
            .contentShape(Rectangle())
            .onTapGesture {
                dismiss()
            }
    }
    
    private var list: some View{
        VStack(alignment: .leading, spacing: 12){
            ContactList(icon: colorScheme == .dark ? .mailColored : .mailBlack, name: "agayev.raffy@gmail.com", navigation: { nav in
                navigation = .email
            })
            
            Divider()
                .padding(.horizontal, -8)
            
            ContactList(icon: colorScheme == .dark ? .phoneColored : .phoneBlack, name: "+994559562020", navigation: { nav in
                
                navigation = .number
            })
            
            Divider()
                .padding(.horizontal, -8)
            
            ContactList(icon: colorScheme == .dark ? .mailColored : .mailBlack, name: "rafaretti20@gmail.com", navigation: { nav in
                navigation = .email
            })
            
        }
        .padding(.vertical, 16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .roundedRectangleStyle(cornerRadius: 12, backgroundColor: colorScheme == .dark ? .colorWhite.opacity(0.03): .colorBlack.opacity(0.03), borderColor: .colorGray, borderWidth: 1.5)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12){
            backButton
            
            headerTitle
            
            list
            
            Spacer()
            
            addNewContact
            
            
        }
        .navigationBarBackButtonHidden()
        .padding(.vertical, 18)
        .padding(.top, 20)
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .sheet(isPresented: $showAddContact) {
            AddNewContactScreen()
                .presentationDetents([.fraction(0.83)])
                .presentationDragIndicator(.visible)
                .presentationCornerRadius(24)
        }
    }
}

extension ContactInfoScreen{
    enum Navigation{
        case email, number
    }
}

#Preview {
    ContactInfoScreen()
}
