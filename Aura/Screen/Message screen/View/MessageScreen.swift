//
//  MessageScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 17.05.26.
//

import SwiftUI

struct MessageScreen: View {
    @Binding var model: InstagramCreatorsModel?
    
    @Environment(\.colorScheme) private var colorScheme
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var hasChangeFollow = false
    
    private var image: some View{
        VStack(spacing: 0){
            if let img = model?.image{
                Image(img)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 100, height: 100)
            }
        }
    }
    
    private var userName: some View{
        VStack(spacing: 0){
            if let userName = model?.userName{
                Text(userName)
                    .fontModifier(size: 20, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            }
        }
    }
    
    private var followerAndPosts: some View{
        HStack(spacing: 6){
            if let follower = model?.follower, let posts = model?.posts{
                Text("\(follower) followers •")
                    .fontModifier(size: 16, weight: .medium, foregroundColor: .colorGray)
                
                Text(String(format: "\(posts) posts", "%1.f"))
                    .fontModifier(size: 16, weight: .medium, foregroundColor: .colorGray)
            }
        }
    }
    
    private var dontFollow: some View{
        Text("You don't follow each other on Instagram")
            .fontModifier(size: 16, weight: .medium, foregroundColor: .colorGray)
    }
    
    private var learnChats: some View{
        Button{
            
        }label: {
            Text("Learn about business chats")
                .fontModifier(size: 16, weight: .medium, foregroundColor: .colorAccentOpacity)
        }
    }
    
    private var followZuck: some View{
        Text("You both follow zuck")
            .fontModifier(size: 16, weight: .medium, foregroundColor: .colorGray)

    }
    
    private var viewProfile: some View{
        Button{
            
        }label: {
            Text("View profile")
                .fontModifier(size: 18, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
                .padding(.vertical, 8)
                .padding(.horizontal, 2)
        }
        .frame(width: 120, height: 40)
        .contentShape(Rectangle())
        .roundedRectangleStyle(cornerRadius: 10, backgroundColor: colorScheme == .dark ? .colorGray.opacity(0.2) : .colorWhite.opacity(0.07), borderColor: .clear, borderWidth: 0)
    }
    
    private var followButton: some View{
        Button{
            withAnimation(.spring){
                hasChangeFollow.toggle()
            }
        }label: {
            Text(hasChangeFollow ? "Following" : "Follow")
                .fontModifier(size: 16, weight: .semibold, foregroundColor: hasChangeFollow ? .colorBlack : .colorWhite)
                .padding(.vertical, 12)
                .padding(.horizontal, 12)
                .frame(maxWidth: .infinity, alignment: .center)
                .contentShape(Rectangle())
            
        }
        
        .buttonStyle(.plain)
        .roundedRectangleStyle(cornerRadius: 8, backgroundColor: hasChangeFollow ? .colorWhite : .backgroundBlue, borderColor: .clear, borderWidth: 0)
    }
    
    private var youCantMessage: some View{
        Text("You can't message this account unless they follow you. To conntect, it may help to follow them.")
            .fontModifier(size: 14, weight: .medium, foregroundColor: .colorGray)
            .multilineTextAlignment(.leading)
            .lineLimit(2)
    }
    
    var body: some View {
        
            VStack(alignment: .center, spacing: 8){
                ScrollView{
                    image
                    userName
                    followerAndPosts
                    dontFollow
                    followZuck
                    learnChats
                    viewProfile
                    
                    
                }
                Spacer()
                Divider()
                    .padding(.horizontal, -16)
                followButton
                youCantMessage
            }
            .padding(.horizontal, 16)
            .navigationBarBackButtonHidden()
            .toolbar {
                toolbar
            }
        }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent{
        ToolbarItemGroup(placement: .topBarLeading) {
            HStack(spacing: 12) {
                Button{
                    dismiss()
                }label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(colorScheme == .dark ? .colorWhite : .colorBlack)
                }
                
                Circle()
                    .fill(LinearGradient(colors: [.orange, .red], startPoint: .bottomLeading, endPoint: .topLeading))
                    .frame(width: 45, height: 45)
                    .overlay{
                        if let image = model?.image{
                            Image(image)
                                .resizable()
                                .scaledToFill()
                                .clipShape(Circle())
                                .frame(width: 39, height: 39)
                        }
                    }
                
                VStack(alignment: .leading, spacing: 4){
                    if let name = model?.name, let userName = model?.userName{
                        Text(name)
                            .fontModifier(size: 12, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
                        
                        Text(userName)
                            .fontModifier(size: 12, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
                        
                        
                    }
                    
                }
            }
        }
    }
}

