//
//  EditUserNameScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 04.05.26.
//

import SwiftUI

struct EditUserNameScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Environment(\.colorScheme) private var colorScheme
    
    @Binding var userName: String
    
    @State private var tempUserName: String = ""
    
    var isInvalidUsername: Bool{
        let trimmer = tempUserName.trimmingCharacters(in: .whitespaces)
        
        return trimmer.isEmpty || tempUserName.count <= 6
    }
    private var editUsername: some View{
        Text("Edit username")
            .fontModifier(size: 18, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
    }
    
    private var headerTitle: some View{
        Text("Changing your username will also change your Instagram profile address.")
            .fontModifier(size: 14, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            .multilineTextAlignment(.leading)
            .lineLimit(2)
    }
    
    private var userNameTextfield: some View{
        HStack{
            VStack(alignment: .leading, spacing: 4){
                Text("Username")
                    .fontModifier(size: 14, weight: .medium, foregroundColor: isInvalidUsername ? .red : .colorGray)
                
                TextField("", text: $tempUserName)
                
            }
            
            Spacer()
            
          
                Image(isInvalidUsername ? .iconErrorUsername : .iconSuccessUsername)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 14, height: 14)
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .roundedRectangleStyle(cornerRadius: 10, backgroundColor: colorScheme == .dark ? .colorBlack.opacity(0.1): .colorWhite.opacity(0.1), borderColor: isInvalidUsername ? .red : .colorGray, borderWidth: 1.5)
    }
    
    private var usernameText: some View{
        Text("Your current Instagram username \(userName) is available")
    }
    
    private var doneButton: some View{
        
        Button{
            userName = tempUserName
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                dismiss()
            }
        }label: {
            Text("Done")
                .fontModifier(size: 14, weight: .semibold, foregroundColor: .colorWhite)
                .padding(.vertical, 16)
                .frame(maxWidth: .infinity, alignment: .center)
                .contentShape(Rectangle())
                .roundedRectangleStyle(cornerRadius: 12, backgroundColor: .colorBlue, borderColor: .clear, borderWidth: 0)
        }
      
        .disabled(isInvalidUsername)
        .opacity(!isInvalidUsername ? 1 : 0.5)
        
       
    }
    
    private var notAvailable: some View{
        Text("Username is not available")
            .fontModifier(size: 14, weight: .medium, foregroundColor: .red)
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 12){
            editUsername
            
            headerTitle
            
            userNameTextfield
            
            if isInvalidUsername{
                notAvailable
            }
            
            usernameText
            
            Spacer()
            
            Divider()
                .padding(.horizontal, -16)
            
            doneButton
        }
        .onAppear{
            tempUserName = userName
        }
        .navigationBarBackButtonHidden()
        .toolbar{
            toolbar
        }
        .padding(.horizontal, 16)
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent{
        ToolbarItem(placement: .topBarLeading) {
            Image(systemName: "chevron.left")
                .foregroundStyle(.colorGray)
                .onTapGesture {
                    dismiss()
                }
        }
    }
}


