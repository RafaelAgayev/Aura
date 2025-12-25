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
        ScrollView{
            VStack(alignment: .leading, spacing: 8) {
                
                ProfileScreenHeader(loginVM: loginVM)
                
                ProfileInfoSection(loginVM: loginVM)
                
                PreferencesSection()
                
                SecuritySection(loginVM: loginVM)
                
                AboutSection()
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(.ultraThickMaterial)
        )
        .padding(.vertical, 10)
        .padding(.horizontal, 12)
        .navigationBarBackButtonHidden()
        .toolbar {
            toolbar
        }
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent{
        
        ToolbarItem(placement: .topBarLeading) {
            Button{
                dismiss()
            }label:{
                Image(systemName: "chevron.left")
                    .foregroundStyle(.primary)
            }
        }
    }
}

//#Preview {
//    ProfileScreen()
//}
