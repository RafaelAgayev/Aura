//
//  LikesScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 06.01.26.
//

import SwiftUI

struct LikesScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Environment(\.showLoading) private var showLoading
    
    @Environment(\.hideLoading) private var hideLoading
    
    @StateObject private var vm = LikeScreenViewModel()
    
    @State private var showEdit = false
    
    @State private var users: [LikeUser] = LikesStorage.load() ?? [
        LikeUser(username: "Rafael Agayev", time: "6h"),
        LikeUser(username: "John Lennon", time: "4h 22m"),
        LikeUser(username: "Arzu Frida", time: "12h"),
        LikeUser(username: "Jeremy Watson", time: "1h 34m 22s"),
        
    ]
    
    @State private var selectedUser: LikeUser?
    
    @State private var newUsername: String = ""
    
    var body: some View {
        
        List{
            ForEach(users) { user in
                LikesRow(
                    username: user.username,
                    time: user.time,
                    onSelect: {   selectedUser = user
                        newUsername = user.username
                        showEdit = true
                    },
                    isLiked: user.isLiked,
                    onLiked: {
                        toggleLike(for: user)
                    }
                )
                   
            }
            .alert("Edit username", isPresented: $showEdit) {
                      TextField("Enter new username", text: $newUsername)

                      Button("Edit", role: .destructive) {
                          editUsername()
                      }

                      Button("Cancel", role: .cancel) { }
                  } message: {
                      Text("You can edit your name")
                  }
        }
        
        .navigationBarBackButtonHidden()
        .toolbar {
            toolbar
        }
    }
        
        @ToolbarContentBuilder
        private var toolbar: some ToolbarContent{
            ToolbarItem(placement: .topBarLeading) {
                Button{
                    dismiss()
                }label: {
                    Image(systemName: "chevron.left")
                        .fontModifier(size: 20, weight: .medium, foregroundColor: .primary)
                }
            }
            
            ToolbarItem(placement: .principal) {
                Text("Likes")
                    .fontModifier(size: 15, weight: .medium, foregroundColor: .primary)
            }
        }
    private func editUsername() {
        guard let selectedUser,
              let index = users.firstIndex(where: { $0.id == selectedUser.id }),
              !newUsername.trimmingCharacters(in: .whitespaces).isEmpty
        else { return }
        
        users[index].username = newUsername
        LikesStorage.save(users)
    }
    
    private func toggleLike(for user: LikeUser) {
        guard let index = users.firstIndex(where: { $0.id == user.id }) else { return }

        users[index].isLiked.toggle()
        LikesStorage.save(users)
    }
}
