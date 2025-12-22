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
    
    var body: some View {
        
        VStack{
            Text("Hello world")
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
                    .fontModifier(size: 17, weight: .semibold, foregroundColor: .colorAccent)
            }
        }
    }
}

//#Preview {
//    MainScreen()
//}
