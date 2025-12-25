//
//  ProfileScreenHeader.swift
//  Aura
//
//  Created by Rafael Agayev on 23.12.25.
//

import SwiftUI
import FirebaseAuth

struct ProfileScreenHeader: View {
    
    let loginVM: LoginScreenViewModel
    
    @State private var showEditAlert = false
    
    @State private var newName: String = ""
    var body: some View {
        HStack{
            
            if let uid = loginVM.user?.uid{
                ProfilImageView(userID: uid)
            }
            VStack(alignment: .leading){
                Text("Name: \(loginVM.name)")
                    .fontModifier(size: 15, weight: .semibold, foregroundColor: .primary)
            }
            Spacer()
            Button("Edit"){
                newName = loginVM.name
                showEditAlert = true
            }
            .buttonStyle(.borderedProminent)
            .tint(.accentColor)
        }
        
        .padding()
        .alert("Edit name", isPresented: $showEditAlert, actions: {
            TextField("Enter new name", text: $newName)
            Button("Save"){
                loginVM.name = newName
            }
            Button("Cancel", role: .cancel){ }
        }, message: { Text("You can update your display name")
        })
    }
}

//#Preview {
//    ProfileScreenHeader()
//}
