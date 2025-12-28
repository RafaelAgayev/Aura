//
//  ProfileScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 23.12.25.
//

import SwiftUI

struct ProfileScreen: View {
    
    let loginVM: LoginScreenViewModel
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 12)
                .fill(.ultraThickMaterial)
                .ignoresSafeArea()
            ScrollView{
                VStack(alignment: .leading, spacing: 8) {
                    
                    content
                }
            }
           
            .padding(.vertical, 10)
            .padding(.horizontal, 12)
            .navigationBarBackButtonHidden()
            .toolbar {
                toolbar
            }
        }
    }
    private var content: some View{
        Group{
            ProfileScreenHeader(loginVM: loginVM)
            
            ProfileInfoSection(loginVM: loginVM)
            
            PreferencesSection()
            
            SecuritySection(loginVM: loginVM)
            
            AboutSection()
        }
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent{
        
        ToolbarItem(placement: .navigationBarLeading) {
            Button{
                dismiss()
            }label:{
                Image(systemName: "chevron.left")
                    .foregroundStyle(.primary)
            }
            .accessibilityLabel("Back")
        }
    }
}

//#Preview {
//    ProfileScreen()
//}
