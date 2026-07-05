//
//  PasswordAndSecurityScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 30.04.26.
//

import SwiftUI

struct PasswordAndSecurityScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Environment(\.colorScheme) private var colorScheme
    
    @State private var navigation: Navigation? = nil
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 12){
                headerTitle
                
                loginList
                
                securityHeaderTitle
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 16)
        .navigationBarBackButtonHidden()
        .toolbar {
            toolbar
        }
        .navigationDestination(item: $navigation) { nav in
            switch nav{
            case .changePassword:
                ChangePasswordScreen()
                
            default:
                EmptyView()
            }
        }
    }
    
    private var headerTitle: some View{
        VStack(alignment: .leading, spacing: 12){
            Text("Password and security")
                .fontModifier(size: 18, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            
            VStack(alignment: .leading, spacing: 4){
                Text("Login & recovery")
                    .fontModifier(size: 14, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
                
                Text("Manage your passwords, login preferences and recovery methods.")
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .fontModifier(size: 14, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite.opacity(0.3) : .colorBlack.opacity(0.3))
            }
        }
    }
    
    private var loginList: some View{
        VStack(alignment: .leading, spacing: 12){
            ListView(
                text: "Change password",
                navigation: { nav in
                    navigation = .changePassword
                })
                
            Divider()
                .padding(.horizontal, -8)
            
            ListView(
                text: "Two-factor authentication",
                navigation: { nav in
                    navigation = .twoFactorAuthentication
                })
            
            Divider()
                .padding(.horizontal, -8)
            
            ListView(
                text: "Verification selfie",
                navigation: { nav in
                    navigation = .verificationSelfie
                })
            
            Divider()
                .padding(.horizontal, -8)
            
            ListView(
                text: "Saved login",
                navigation: { nav in
                    navigation = .savedLogin
                })
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .roundedRectangleStyle(cornerRadius: 12, backgroundColor: colorScheme == .dark ? .colorWhite.opacity(0.05) : .colorBlack.opacity(0.05), borderColor: .colorGray, borderWidth: 1.5)
    }
    
    private var securityHeaderTitle: some View{
        VStack(alignment: .leading, spacing: 12){
            VStack(alignment: .leading, spacing: 8){
                Text("Security checks")
                    .fontModifier(size: 18, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
                Text("Review security issues by running checks across apps, devices and emils sent.")
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .fontModifier(size: 14, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite.opacity(0.3) : .colorBlack.opacity(0.3))
            }
            
            securityChecks
        }
    }
    
    private var securityChecks: some View{
        VStack(alignment: .leading, spacing: 12){
        
            ListView(
                text: "Where you're logged in",
                navigation: { nav in
                    navigation = .loggedIn
                })
            
            Divider()
                .padding(.horizontal, -8)
            
            ListView(
                text: "Recent emails",
                navigation: { nav in
                    navigation = .recentEmails
                })
            
            Divider()
                .padding(.horizontal, -8)
            
            ListView(
                text: "Security Checkup",
                navigation: { nav in
                    navigation = .securityCheckup
                })
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .roundedRectangleStyle(cornerRadius: 12, backgroundColor: colorScheme == .dark ? .colorWhite.opacity(0.05) : .colorBlack.opacity(0.05), borderColor: .colorGray, borderWidth: 1.5)
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

extension PasswordAndSecurityScreen{
    enum Navigation{
        case changePassword, twoFactorAuthentication, verificationSelfie, savedLogin, loggedIn, recentEmails, securityCheckup
    }
}

