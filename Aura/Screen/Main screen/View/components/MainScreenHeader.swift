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
            Text("Welcome back \(loginVM.name) 👋")
                .fontModifier(size: 16, weight: .medium, foregroundColor: .primary)
            
            Text("Let’s check how you’re doing today")
                .foregroundStyle(.primary)
        }
    }
}

//#Preview {
//    MainScreenHeader()
//}
