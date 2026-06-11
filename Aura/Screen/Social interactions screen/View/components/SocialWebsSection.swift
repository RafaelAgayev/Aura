//
//  SocialWebsSection.swift
//  Aura
//
//  Created by Rafael Agayev on 08.06.26.
//

import SwiftUI

struct SocialWebsSection: View {
    
    let profilImg: ImageResource
    
    let socialWebIcon: ImageResource
    
    let username: String
    
    let socialWebName: String
    
    @Environment(\.colorScheme) private var colorScheme
    
    private var Img: some View{
        Image(profilImg)
            .resizable()
            .scaledToFill()
            .clipShape(Circle())
            .frame(width: 40, height: 40)
            .overlay(alignment: .bottomTrailing) {
                Circle()
                    .fill(.colorBlack)
                    .frame(
                        width: 20, height: 20
                    )
                    .overlay {
                        Image(socialWebIcon)
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 18, height: 18)
                    }
            }
    }
    
    private var nameAndSocialWebname: some View{
        VStack(alignment: .leading, spacing: 3){
            Text(username)
                .fontModifier(size: 16, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            
            Text(socialWebName)
                .fontModifier(size: 16, weight: .medium, foregroundColor: .colorGray)
            
        }
    }
    
    private var rightButton: some View{
        Image(.iconRightGray)
            .resizable()
            .scaledToFill()
            .frame(width: 16, height: 16)
    }
    
    
    var body: some View {
        HStack(alignment: .center, spacing: 12){
            Img
            
            nameAndSocialWebname
            
            Spacer()
            
            rightButton
        }
        
    }
}
