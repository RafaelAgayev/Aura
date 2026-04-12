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
    
    var onChange: ((String, String) -> Void)? = nil
    
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
            Button{
                newName = loginVM.name
                showEditAlert = true
                
            }label: {
                Text("Edit")
            }
            .foregroundStyle(.colorWhite)
            .background(
                Color.colorGreenWhatsapp
                
                    .frame(width: 90,height: 30)
                    .blur(radius: 2)
                    .roundedCorners(cornerRadius: 12)
            )
        }
        
        .padding()
        .alert("Edit name", isPresented: $showEditAlert, actions: {
            TextField("Enter new name", text: $newName)
            Button("Save"){
                loginVM.name = newName
                
                    onChange?("New name is updated", newName)
            }
            Button("Cancel", role: .cancel){ }
        }, message: {
            Text("You can update your display name")
        })
    }
}

//#Preview {
//    ProfileScreenHeader()
//}
