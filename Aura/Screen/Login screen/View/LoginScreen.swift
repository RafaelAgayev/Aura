//
//  LoginScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 22.12.25.
//

import SwiftUI

struct LoginScreen: View {
    
    @StateObject private var loginVM = LoginScreenViewModel()
    
    @Environment(\.showLoading) private var showLoading
    
    @Environment(\.hideLoading) private var hideLoading

    
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
            .onChange(of: loginVM.isLoading) { _, isLoading in
                isLoading ? showLoading() : hideLoading ()
            }

        }
    }
}

#Preview {
    LoginScreen()
}
