//
//  SecuritySection.swift
//  Aura
//
//  Created by Rafael Agayev on 23.12.25.
//

import SwiftUI

struct SecuritySection: View {
    
    let loginVM: LoginScreenViewModel
    
    @State private var useFaceID = false
    
    @State private var showEditPassword = false
    
    @State private var newPassword = ""
    
    var onChange: ((String) -> Void)? = nil
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack{
                Text("Change password")
                    .foregroundStyle(.primary)
                
                Spacer()
                Button{
                    newPassword = loginVM.password
                    showEditPassword = true
                    
                }label:{
                    Text("Edit")
                }
              
                .foregroundStyle(.colorWhite)
                .background(
                    Color.colorAccent
    
                        .frame(width: 90,height: 30)
                        .blur(radius: 2)
                        .roundedCorners(cornerRadius: 12)
                )
            }
            .alert("Edit password", isPresented: $showEditPassword, actions: {
                TextField("Enter new password ", text: $newPassword)
                
                Button{
                    loginVM.password = newPassword
                    Task{
                    onChange?("Password updated: \(newPassword)")
                    }
                }label:{
                    Text("Edit")
                }
                Button("Cancel", role: .cancel) {}
            }, message: {
                Text("You can edit your password")
            })
            
            Toggle("Face ID", isOn: $useFaceID)
                .onChange(of: useFaceID) { oldValue, newValue in
                    
                    onChange?("FaceID: \(newValue ? "enabled" : "disabled")")
                }
        }
        .padding()
    }
}

//#Preview {
//    SecuritySection()
//}
