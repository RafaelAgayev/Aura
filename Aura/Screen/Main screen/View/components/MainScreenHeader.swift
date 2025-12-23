//
//  MainScreenHeader.swift
//  Aura
//
//  Created by Rafael Agayev on 23.12.25.
//

import SwiftUI

struct MainScreenHeader: View {
    
    let loginVM: LoginScreenViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 6){
            Text("Welcome back \(loginVM.userName) 👋")
                .fontModifier(size: 10, weight: .medium, foregroundColor: .colorBlack)
            
            Text("Let’s check how you’re doing today")
                .foregroundStyle(.secondary)
        }
    }
}

//#Preview {
//    MainScreenHeader()
//}
