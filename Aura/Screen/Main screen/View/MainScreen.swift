//
//  MainScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 22.12.25.
//

import SwiftUI
import CoreData

struct MainScreen: View {
    
    let loginVM: LoginScreenViewModel
    
    @State private var isPressed: Bool = false
    
    @StateObject private var historyVM: HistoryViewModel
    
    @StateObject private var vm = MainScreenViewModel()
    
    init(historyVM: HistoryViewModel, loginVM: LoginScreenViewModel) {
        _historyVM = StateObject(wrappedValue: historyVM)
        self.loginVM = loginVM
    }
    
    @Environment(\.dismiss) private var dismiss
    
    @Environment(\.showLoading) private var showLoading
    
    @Environment(\.hideLoading) private var hideLoading
    
    
    var body: some View {
        ScrollView{
            
           content
            
        }
        .refreshable {
            
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            toolbar
        }
        .onAppear{
            
        }
        .onChange(of: vm.isLoading) { _, isLoading in
            isLoading ? showLoading() : hideLoading()
        }
        .overlay{
            if vm.showLogoutDialog{
                Color.colorBlack.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation{
                            vm.showLogoutDialog = false
                        }
                    }
                LogoutSettings(
                    showDialog: $vm.showLogoutDialog,
                    onLogout: {
                        await loginVM.logoutUser()
                    }
                )
            }
        }
        
    }
    
    private var content: some View{
        VStack(alignment: .leading, spacing: 24){
            MainScreenHeader(loginVM: loginVM)
            
            DashboardSection(historyVM: historyVM, loginVM: loginVM)
        }
        .padding()
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent{
        ToolbarItem(placement: .topBarTrailing) {
            Button{
                withAnimation {
                    vm.showLogoutDialog = true
                }
            }label: {
                Image(.logout)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
            }
        }
    }
}
