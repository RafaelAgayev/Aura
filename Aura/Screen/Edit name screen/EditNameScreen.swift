//
//  EditNameScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 04.05.26.
//

import SwiftUI

struct EditNameScreen: View {
    
    
    @Environment(\.dismiss) private var dismiss
    
    @Environment(\.colorScheme) private var colorScheme
    
    @Binding var name: String
    
    @State private var tempName: String = ""

    
    private var Named: some View{
        Text("Name")
            .fontModifier(size: 18, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
    }
    
    private var nameTextField: some View{
        VStack(alignment: .leading, spacing: 4){
            
            Text("Name")
                .fontModifier(size: 14, weight: .semibold, foregroundColor: .colorGray)
            
            TextField("Enter name", text: $tempName)
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .roundedRectangleStyle(cornerRadius: 10, backgroundColor: colorScheme == .dark ? .colorBlack.opacity(0.1): .colorWhite.opacity(0.1), borderColor: .colorGray, borderWidth: 1.5)
    }
    
    private var changedOnly: some View{
        Text("You can only change your name twice within 14 days")
            .fontModifier(size: 14, weight: .medium, foregroundColor: .colorGray)
    }
    
    private var saveButton: some View{
        Text("Save")
            .fontModifier(size: 14, weight: .semibold, foregroundColor: .colorWhite)
            .padding(.vertical, 12)
            .frame(maxWidth: .infinity, alignment: .center)
            .roundedRectangleStyle(cornerRadius: 12, backgroundColor: .colorBlue, borderColor: .clear, borderWidth: 0)
            .contentShape(Rectangle())
            .onTapGesture {
                name = tempName
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                    dismiss()
                }
            }
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            Named
            
            nameTextField
            
            changedOnly
            
            Spacer()
            
            Divider()
                .padding(.horizontal, -16)
            
            saveButton
            
            
        }
        .onAppear{
            tempName = name
        }
        .padding(.horizontal, 16)
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
                    dismiss()
                }
        }
    }
}
