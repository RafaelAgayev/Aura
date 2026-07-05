//
//  LoginScreenViewModel.swift
//  Aura
//
//  Created by Rafael Agayev on 22.12.25.
//

import Foundation
import SwiftUI
import FirebaseAuth
internal import Combine

class LoginScreenViewModel: BaseViewModel{
    
    @Published var email: String = ""
    
    @Published var password: String = ""
    
    @Published var user: User? = nil
    
    @Published var isAuthorized: Bool = false
    
    @Published var alertMessage: String = ""
    
    @Published var showAlert: Bool = false
    
    @AppStorage("user_name") var name: String = ""
    
    @Published var showPassword: Bool = false
    
    override init(){
        super.init()
        self.user = Auth.auth().currentUser
        if self.user != nil {
            
            isAuthorized = true
        }else {
            
            isAuthorized = false
        }
        Auth.auth().addStateDidChangeListener { _, user in
            DispatchQueue.main.async {
                self.user = user
                self.isAuthorized = user != nil
                self.email = user?.email ?? ""
            }
        }
    }
    
    func createUser() {
        Task{
            await withLoading{
                
                Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
                    guard let self else {return}
                    DispatchQueue.main.async {
                        
                        if let error = error {
                            
                            self.alertMessage = error.localizedDescription
                            self.showAlert = true
                        } else if let user = result?.user {
                            self.user = user
                            self.email = user.email ?? ""
                            self.isAuthorized = true
                        }
                    }
                }
            }
        }
    }
    
    func signInUser() {
        Task{
            await withLoading{
                
                Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
                    DispatchQueue.main.async {
                        
                        if let error = error {
                            
                            self?.alertMessage = error.localizedDescription
                            self?.showAlert = true
                        } else if let user = result?.user {
                            
                            self?.user = user
                            self?.email = user.email ?? ""
                            self?.isAuthorized = true
                        }
                    }
                }
            }
        }
    }
    
    func logoutUser () async {
        Task{
            
            do{
               try await withLoading{
                    try Auth.auth().signOut()
                    self.user = nil
                    self.isAuthorized = false
                    print("Logout successful")
                }
            }catch{
                print("Logout failed: \(error.localizedDescription)")
                self.alertMessage = error.localizedDescription
                self.showAlert = true
            }
        }
    }
}
