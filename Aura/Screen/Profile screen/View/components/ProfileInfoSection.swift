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
    
    @Environment(\.colorScheme) private var colorScheme
    
    var onChange: ((String, String) ->  Void)? = nil
    
    var body: some View {
        HStack{
            Text("E-mail:\n \(loginVM.email)")
            
            Spacer()
            
            Button{
                newEmail = loginVM.email
                showEditAlert = true
            }label:{
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
        .alert("Edit email", isPresented: $showEditAlert, actions: {
            TextField("Enter your email", text: $newEmail)
            Button{
                
                loginVM.email = newEmail
                Task{
                    onChange?("New email updated", newEmail)
                }
            }label:{
                Text("Save")
            }
            Button("Cancel", role: .cancel) {}
        }, message: { Text("You can update your email")
        } )
        
    }
}

//#Preview {
//    ProfileInfoSection()
//}
