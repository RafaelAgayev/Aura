//
//  LoginScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 22.12.25.
//

import SwiftUI

struct LoginScreen: View {
    
    @StateObject private var loginVM = LoginScreenViewModel()
    
    var body: some View {
        VStack(spacing: 12){
            LoginSection(
                email: $loginVM.email,
                password: $loginVM.password,
                name: $loginVM.name,
                showPassword: $loginVM.showPassword,
                onSignIn: {
                    loginVM.signInUser()
                },
                onRegister: {
                    loginVM.createUser()
                }
            )
        }
    }
}

#Preview {
    LoginScreen()
}
