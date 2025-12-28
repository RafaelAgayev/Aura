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
    
    init(historyVM: HistoryViewModel, loginVM: LoginScreenViewModel) {
        _historyVM = StateObject(wrappedValue: historyVM)
        self.loginVM = loginVM
    }
    
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 24){
                MainScreenHeader(loginVM: loginVM)
                
                DashboardSection(historyVM: historyVM, loginVM: loginVM)
                
                    .scaleEffect(isPressed ? 0.97 : 1)
                    .foregroundStyle(.primary)
                
            }

            .padding()
            
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            toolbar
        }
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent{
        ToolbarItem(placement: .topBarTrailing) {
            Button{
                loginVM.logoutUser()
            }label: {
                Image(systemName: "arrowshape.turn.up.backward.2")
                    .fontModifier(size: 17, weight: .semibold, foregroundColor: .colorBlack)
            }
        }
    }
}

//#Preview {
//    MainScreen()
//}
