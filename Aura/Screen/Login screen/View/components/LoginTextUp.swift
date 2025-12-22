//
//  LoginTextUp.swift
//  Aura
//
//  Created by Rafael Agayev on 22.12.25.
//

import SwiftUI

struct LoginTextUp: View {
    
    @Binding var email: String
    
    @Binding var password: String
    
    @Binding var showPassword: Bool
    
    @FocusState private var focused: Focused?
    
    var onSignIn: () -> Void
    
    var onRegister: () -> Void
    
    var body: some View {
        
        Image("LoginLogo")
            .resizable()
            .scaledToFit()
        
        VStack(spacing: 6){
            Text("Welcome to Aura")
                .fontModifier(size: 22, weight: .semibold, foregroundColor: .colorBlack)
            
            Text("Please sign in")
                .fontModifier(size: 16, weight: .medium, foregroundColor: .colorGray)
            
            VStack(spacing: 8){
                
                    TextField("Enter email", text: $email)
                        .inputModifier()
                        .textInputAutocapitalization(.never)
                        .keyboardType(.asciiCapable)
                        .textContentType(.oneTimeCode)
                        .focused($focused, equals: .email)
                HStack{
                    if !showPassword{
                        SecureField("Password", text: $password)
                            .focused($focused, equals: .password)
                            .padding(.leading, 3)
                            .autocorrectionDisabled(true)
                            .textInputAutocapitalization(.never)
                            .keyboardType(.asciiCapable)
                            .textContentType(.oneTimeCode)
                    }else {
                        TextField("Password", text: $password)
                            .padding(.leading, 3)
                            .autocorrectionDisabled(true)
                            .textInputAutocapitalization(.never)
                            .keyboardType(.asciiCapable)
                            .textContentType(.oneTimeCode)
                            .focused($focused, equals: .password)
                        
                    }
                    Button{
                        showPassword.toggle()
                    }label: {
                        Image(systemName: showPassword ? "eye.slash" : "eye")
                            .foregroundStyle(.colorGray)
                    }
                }
                .inputModifier()
                
                HStack{
                    Button{
                        onSignIn()
                    }label:{
                        Text("Sign in")
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .fontModifier(size: 18, weight: .semibold)
                    }
                    .primaryActionModifier()
                    
                    Button{
                        onRegister()
                    }label:{
                        Text("Register")
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .fontModifier(size: 18, weight: .semibold)
                    }
                    .primaryActionModifier()
                }
            }
            .padding()
            
        }
    }
}

extension LoginTextUp{
    enum Focused{
        case email, password
    }
}

//#Preview {
//    LoginTextUp()
//}
