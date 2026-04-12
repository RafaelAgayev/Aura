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
    
    @StateObject private var historyVM: HistoryViewModel
    
    init(loginVM: LoginScreenViewModel, historyVM: HistoryViewModel) {
        self.loginVM = loginVM
        _historyVM = StateObject(wrappedValue: historyVM)
        _profileVM = StateObject(
            wrappedValue: ProfileViewModel(historyVM: historyVM)
        )
    }
    @StateObject private var profileVM: ProfileViewModel
    
    @Environment(\.showLoading) private var showLoading
    
    @Environment(\.hideLoading) private var hideLoading
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 12)
                .fill(.ultraThickMaterial)
                .ignoresSafeArea()
            ScrollView{
                VStack(alignment: .leading, spacing: 8) {
                    
                    content
                }
                .roundedRectangleStyle(cornerRadius: 16, backgroundColor: .colorWhite, borderColor: .colorGreenWhatsapp, borderWidth: 1)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 12)
            .navigationBarBackButtonHidden()
            .toolbar {
                toolbar
            }
            .onChange(of: profileVM.isLoading) { _, isLoading in
                isLoading ? showLoading() : hideLoading()
            }
            
            AboutSection()
        }
    }
    private var content: some View{
        Group{
            ProfileScreenHeader(loginVM: loginVM, onChange: { _, value in
                historyVM.add(
                    type: "Profile",
                    title: "Header",
                    subtitle: "New name is: \(value)"
                )
            })
            
            ProfileInfoSection(loginVM: loginVM,
                               onChange: { _, value in
                historyVM.add(
                    type: "Profile",
                    title: "Info updated",
                    subtitle: "New email updated: \(value)"
                )
            })
            
            PreferencesSection(onChange: { _, value in
                historyVM.add(
                    type: "Profile",
                    title: "Preferences",
                    subtitle: "App theme is: \(value)"
                )
            })
            
            SecuritySection(loginVM: loginVM, onChange: { change in
                historyVM.add(
                    type: "Profile",
                    title: "Security",
                    subtitle: "Password updated: \(change)"
                )
            })
        }
//        .padding()
//        .roundedRectangleStyle(cornerRadius: 16, backgroundColor: .colorWhite, borderColor: .colorGreenWhatsapp, borderWidth: 1)
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
            
        }
    }
}

//#Preview {
//    ProfileScreen()
//}
