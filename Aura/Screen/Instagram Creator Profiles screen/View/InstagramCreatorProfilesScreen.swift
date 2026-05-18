//
//  InstagramCreatorProfilesScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 13.05.26.
//

import SwiftUI

struct InstagramCreatorProfilesScreen: View {
    
    @Binding var model: InstagramCreatorsModel?
    
    @Environment(\.dismiss) private var dismiss
    
    
    @Environment(\.colorScheme) private var colorScheme
    
    @State private var followChange = false
    
    @State private var index = 0
    
    @State private var route: RouteField? = nil
    
    
    private var name: some View{
        VStack{
            if let name = model?.name{
                Text(name)
                    .fontModifier(size: 18, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite: .colorBlack)
            }
        }
    }
    
    private var image: some View{
        VStack(spacing: 0){
            
            Circle()
                .fill(LinearGradient(colors: [.orange, .red], startPoint: .bottomLeading, endPoint: .topLeading))
                .frame(width: 65, height: 65)
                .overlay{
                    if let image = model?.image{
                        Image(image)
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 59, height: 59)
                    }
                }
        }
    }
    
    private var posts: some View{
        VStack(alignment: .leading, spacing: 3){
            if let posts = model?.posts{
                Text(String(format: "\(posts)", "%1.f"))
                    .fontModifier(size: 14, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            }
            
            Text("posts")
                .fontModifier(size: 14, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
        }
    }
    
    private var followers: some View{
        VStack(alignment: .leading, spacing: 4){
            if let follower = model?.follower{
                Text(follower)
                    .fontModifier(size: 14, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            }
            
            Text("followers")
                .fontModifier(size: 14, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
        }
    }
    
    private var following: some View{
        VStack(alignment: .leading, spacing: 4){
            if let following = model?.following{
                Text(following)
                    .fontModifier(size: 14, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
                Text("following")
                    .fontModifier(size: 14, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            }
        }
    }
    
    private var followButton: some View{
        Button{
            followChange.toggle()
        }label: {
            Text(followChange ? "Following" : "Follow")
                .fontModifier(size: 14, weight: .semibold, foregroundColor: followChange ? .colorBlack : .colorWhite)
                .padding(.vertical, 8)
                .padding(.horizontal, 18)
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .contentShape(Rectangle())
        .roundedRectangleStyle(cornerRadius: 10, backgroundColor: followChange ? .colorWhite : .backgroundBlue, borderColor: followChange ? .colorGray : .clear, borderWidth: 1.5)
        
    }
    
    private var messageButton: some View{
        Button{
            route = .message
        }label: {
            Text("Message")
                .fontModifier(size: 14, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
                .padding(.vertical, 8)
                .padding(.horizontal, 18)
                
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .contentShape(Rectangle())
        .roundedRectangleStyle(cornerRadius: 10, backgroundColor: colorScheme == .dark ? .colorBlack.opacity(0.05) : .colorWhite.opacity(0.03), borderColor: .colorGray, borderWidth: 1.5)
    }
    
    private var subscribeButton: some View{
        Button{
            
        }label: {
            Text("Subscribe")
                .fontModifier(size: 12, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
                .padding(.vertical, 8)
                .padding(.horizontal, 18)
        }
       
        .frame(maxWidth: .infinity, alignment: .center)
        .contentShape(Rectangle())
        .roundedRectangleStyle(cornerRadius: 10, backgroundColor: colorScheme == .dark ? .colorBlack.opacity(0.05) : .colorWhite.opacity(0.03), borderColor: .colorGray, borderWidth: 1.5)
    }
    
    private var personPlus: some View{
        Button{
            
        }label: {
            Image(colorScheme == .dark ? .personPlusColored : .personPlusBlack)
                .resizable()
                .scaledToFit()
                .frame(width: 18, height: 18)
                .padding(.vertical, 8)
                .padding(.horizontal, 18)
        }
        .frame(width: 40, height: 30)
        .contentShape(Rectangle())
        .roundedRectangleStyle(cornerRadius: 10, backgroundColor: colorScheme == .dark ? .colorBlack.opacity(0.05) : .colorWhite.opacity(0.03), borderColor: .colorGray, borderWidth: 1.5)
        
    }
    
    private var header: some View{
        HStack(alignment: .top, spacing: 14){
            image
            
            VStack(alignment: .leading, spacing: 16){
                name
                
                HStack(spacing: 20){
                    posts
                    
                    Spacer()
                    
                    followers
                    
                    Spacer()
                    
                    following
                    
                }
                .padding(.horizontal, 4)
                
            }
        }
    }
    
    
    
    private var buttons: some View{
        HStack(spacing: 6) {
          
            followButton
            
            messageButton
            
            subscribeButton
            
            personPlus
            
            Spacer()
        }
    }
    
  
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 20){
                header
                
                buttons
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 12)
        .navigationBarBackButtonHidden()
        .toolbar {
            toolbar
        }
        .navigationDestination(item: $route){ navigation in
            switch navigation{
            case .message:
                MessageScreen(model: $model)
            case .person:
                EmptyView()
            case .subscribe:
                EmptyView()
            }
        }
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent{
        ToolbarItemGroup(placement: .topBarLeading) {
            HStack(spacing: 12) {
                Image(systemName: "chevron.left")
                    .fontModifier(size: 18, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        dismiss()
                    }
                if let userName = model?.userName{
                    Text(userName)
                        .fontModifier(size: 22, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
                }
            }
        }
        
        ToolbarItem(placement: .topBarTrailing) {
            Image(.icon3Dot)
                .resizable()
                .scaledToFit()
                .frame(width: 22, height: 22)
                
        }
    }
}

extension InstagramCreatorProfilesScreen{
    enum RouteField: Hashable, Identifiable{
        
        var id: Self { self}
        case message, subscribe, person
    }
}
