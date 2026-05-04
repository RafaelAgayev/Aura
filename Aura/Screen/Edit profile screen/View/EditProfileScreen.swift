//
//  EditProfileScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 03.05.26.
//

import SwiftUI

struct EditProfileScreen: View {
    
    @Binding var model: ProfileModel
    
    @State private var route: RouteField? = nil
    
    @Environment(\.dismiss) private var dismiss
    
    @Environment(\.colorScheme) private var colorScheme
    
    
    private var profilImg: some View{
        Image(model.profilImg)
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .frame(width: 150, height: 150)

    }
    
    private var userNameAndSocialWebName: some View{
        HStack(spacing: 10) {
            Text("\(model.userName ) • ")
                .fontModifier(size: 16, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorGray : .colorBlack)
            
            Text("\(model.socialWebName)")
                .fontModifier(size: 16, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorGray : .colorBlack)

        }
    }
    
    private var named: some View{
        Text(model.name)
            .fontModifier(size: 14, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
    }
    
    private var listMenu: some View{
        VStack(alignment: .leading, spacing: 12){
            EditView(named: "Name") { _ in
                route = .name
            }
            
            Divider()
                .padding(.horizontal, -8)
            
            EditView(named: "Username") { _ in
                route = .userName
            }
            
            Divider()
                .padding(.horizontal, -8)
            
            
            EditView(named: "Profil picture") { _ in
                route = .profilImg
            }
            
            Divider()
                .padding(.horizontal, -8)
            
            
            EditView(named: "Avatar") { _ in
                route = .avatar
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 8)
        .frame(maxWidth: .infinity, alignment: .leading)
        .roundedRectangleStyle(
            cornerRadius: 12,
            backgroundColor: colorScheme == .dark ? .colorBlack.opacity(0.1) : .colorWhite.opacity(0.1),
            borderColor: .colorGray,
            borderWidth: 1.5
        )
    }
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 12){
            profilImg
            
            named
            
            userNameAndSocialWebName
            
            listMenu
            
            Spacer()
        }
        .padding(.horizontal, 16)
        .navigationBarBackButtonHidden()
        .toolbar {
            toolbar
        }
        
        .navigationDestination(item: $route) { navigation in
            switch navigation{
                
            case .name:
                EditNameScreen(name: $model.name)
                
            case .userName:
                EditUserNameScreen(userName: $model.userName)
                
            case .profilImg:
                EditProfilImgScreen()
                
            case .avatar:
                EditAvatarScreen()
            }
        }
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent{
        ToolbarItem(placement: .topBarLeading) {
            Button{
               dismiss()
            }label: {
                Image(systemName: "chevron.left")
                    .foregroundStyle(colorScheme == .dark ? .colorWhite : .colorBlack)
            }
        }
    }
}

extension EditProfileScreen{
    enum RouteField{
        case name, userName, profilImg, avatar
    }
}


