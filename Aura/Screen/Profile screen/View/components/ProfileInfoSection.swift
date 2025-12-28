//
//  ProfileInfoSection.swift
//  Aura
//
//  Created by Rafael Agayev on 23.12.25.
//

import SwiftUI

struct ProfileInfoSection: View {
    
    let loginVM: LoginScreenViewModel
    
    @State private var showEditAlert = false
    
    @State private var newEmail: String = ""
    
    var body: some View {
            HStack{
            Text("E-mail: \(loginVM.email)")
                
            Spacer()
                
                Button{
                    newEmail = loginVM.email
                    showEditAlert = true
                }label:{
                    Text("Edit")
                }
                .padding()
                .foregroundStyle(.colorWhite)
                .background(
                    Color.colorAccent
    
                        .frame(width: 80,height: 30)
                        .blur(radius: 2)
                        .roundedCorners(cornerRadius: 12)
                )
        }
        .padding()
        .alert("Edit email", isPresented: $showEditAlert, actions: {
            TextField("Enter your email", text: $newEmail)
            Button{
                loginVM.email = newEmail
            }label:{
                Text("Save")
            }
            Button("Cancel", role: .cancel) {}
        }, message: { Text("You can update your email")} )
        
    }
}

//#Preview {
//    ProfileInfoSection()
//}
