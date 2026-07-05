//
//  AddNewContactScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 10.05.26.
//

import SwiftUI

struct AddNewContactScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Environment(\.colorScheme) private var colorScheme
    
    @State private var navigation: Navigation? = nil
    
    private var closeButton: some View{
        Image(systemName: "xmark")
            .resizable()
            .scaledToFit()
            .frame(width: 14, height: 14)
            .foregroundStyle(colorScheme == .dark ? .colorWhite : .colorBlack)
            .contentShape(Rectangle())
            .onTapGesture {
                dismiss()
            }
    }
    
    private var headerTitle: some View{
        Text("Which would you like to add?")
            .fontModifier(size: 22, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
    }
    
    private var numberAndEmail: some View{
        VStack(alignment: .leading, spacing: 12){
            
            Button{
                withAnimation(.spring(duration: 0.11)){
                    navigation = .number
                }
            }label: {
                HStack{
                    Text("Add mobile number")
                        .fontModifier(size: 14, weight: .semibold, foregroundColor: .backgroundBlue)
                    Spacer()
                }
                .contentShape(Rectangle())
            }
            
            Divider()
                .padding(.horizontal, -8)
            
            Button{
                withAnimation(.spring(duration: 0.11)){
                    navigation = .email
                }
            }label: {
                
                HStack{
                    Text("Add email")
                        .fontModifier(size: 14, weight: .semibold, foregroundColor: .backgroundBlue)
                    
                    Spacer()
                }
                .contentShape(Rectangle())
            }
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 10)
        .roundedRectangleStyle(cornerRadius: 12, backgroundColor: colorScheme == .dark ? .colorBlack.opacity(0.03) : .colorWhite.opacity(0.03), borderColor: .colorGray, borderWidth: 1.5)
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 16){
            closeButton
            
            headerTitle
            
            numberAndEmail
            
            Spacer()
        }
        .padding(.top, 32)
        .padding(.horizontal, 14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .sheet(item: $navigation) { route in
            switch route{
            case .number:
                AddMobileNumberScreen()
                    .presentationCornerRadius(24)
                    .interactiveDismissDisabled(true)
            case .email:
                AddEmailScreen()
            }
        }
        
    }
}

extension AddNewContactScreen{
    fileprivate enum Navigation: Identifiable{
        
        var id: Self { self }
        case number, email
    }
}
