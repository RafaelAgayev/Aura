//
//  ConnectedScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 30.04.26.
//

import SwiftUI

struct ConnectedExperienceScreen: View {
    
    @Environment(\.colorScheme) private var colorScheme
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var router: Route? = nil
    
    private func backButton() -> some View{
        Image(systemName: "chevron.left")
            .foregroundStyle(colorScheme == .dark ? .colorWhite : .colorBlack)
            
    }
    
    private func accounts() -> some View{
        Text("Add accounts")
            .fontModifier(size: 16, weight: .medium, foregroundColor: .blue)
            .padding(.vertical, 18)
            .padding(.horizontal, 14)
            .frame(maxWidth: .infinity, alignment: .leading)
            .roundedRectangleStyle(cornerRadius: 18, backgroundColor: .clear, borderColor: .colorGray, borderWidth: 1.5)
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation{
                    router = .accounts
                }
            }
    }
    
    private func headerTitle() -> some View{
        VStack(alignment: .leading, spacing: 10) {
            Text("Connected experiences")
                .fontModifier(size: 20, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            
            Text("Activities and features that work across two or more accounts you've added to the same Accounts Center. Control how you use these experiences across your accounts.")
                .fontModifier(size: 16, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
                .multilineTextAlignment(.leading)
                .lineLimit(4)
        }
    }
    
    private func scrollContent() -> some View{
        ScrollView{
            VStack(alignment: .leading, spacing: 24) {
                
                headerTitle()
                
                accounts()
                
                contentMainSection()
                
                infoAndAccessMainSection()
                
                friendAndFollowerMain()
            }
        }
    }
    
    private func sharingProfiles () -> some View{
        contentSector(
            image: colorScheme == .dark ? .personColored : .personBlack,
            title: "Sharing across profiles",
            onTap: { _ in
                router = .sharingProfiles
            })
    }
    
    private func facebookDatingInstagram() -> some View{
        contentSector(
            image: colorScheme == .dark ? .heartColored : .heartBlack,
            title: "Facebook Dating and Instagram",
            onTap: { _ in
                router = .facebookDatingAndInstagram
            })
    }
    
    private func memoriesFromInstagram () -> some View{
        contentSector(
            image: colorScheme == .dark ? .pictureColored : .pictureBlack,
            title: "Memories from Instagram",
            onTap: { _ in
                router = .memoriesFromInstagram
            })
    }
    
    private func mediaOnMetaDevices () -> some View{
        contentSector(
            image: colorScheme == .dark ? .mediaColored : .mediaBlack,
            title: "Media on Meta devices",
            onTap: { _ in
                router = .mediaOnDevices
            })
    }
    
    private func syncingProfilePicture() -> some View{
        contentSector(
            image: colorScheme == .dark ? .profilPicColored : .profilPicBlack,
            title: "Syncing profile pictures",
            onTap: { _ in
                router = .synchingProfilePictures
            })
    }
    
    private func managingAvatars () -> some View{
        contentSector(
            image: colorScheme == .dark ? .avatarColored : .avatarBlack,
            title: "Managing avatars",
            onTap: { _ in
                router = .managingAvatars
            })
    }
    
    private func showingLink() -> some View{
        contentSector(
            image: colorScheme == .dark ? .linkColored : .linkBlack,
            title: "Showing links for your profiles",
            onTap: { _ in
                router  = .showingLinkProfile
            })
    }
    
    private func profileSuggestions() -> some View{
        contentSector(
            image: colorScheme == .dark ? .personGlassColored : .personGlassBlack,
            title: "Profile suggestions",
            onTap: { _ in
                router = .profileSuggestions
            })
    }
    
    private func followingPeople() -> some View{
        contentSector(
            image: colorScheme == .dark ? .personPlusColored : .personPlusBlack,
            title: "Following people in Meta Horizon",
            onTap: { _ in
                router = .followingPeopleMetaHorizon
            })
    }
    
    private func friendAndFollowerRectSection() -> some View{
        VStack(alignment: .leading, spacing: 8) {
            profileSuggestions()
            
            Divider()
                .padding(.horizontal, -8)
            
            followingPeople()
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .roundedRectangleStyle(cornerRadius: 18, backgroundColor: .clear, borderColor: .colorGray, borderWidth: 1.6)
    }
    
    private func friendAndFollowerMain() -> some View{
        VStack(alignment: .leading, spacing: 12) {
            Text("Friends and followers")
                .fontModifier(size: 18, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            
            friendAndFollowerRectSection()
        }
    }
    
    
    private func contentMainSection () -> some View{
        VStack(alignment: .leading, spacing: 12) {
            Text("Content")
                .fontModifier(size: 18, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            
        
            contentRectSection()
        }
    }
    
    private func infoAndAccessMainSection() -> some View{
        VStack(alignment: .leading, spacing: 12) {
            Text("Profile info and access")
                .fontModifier(size: 18, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            
            infoAndAccessSection()
        }
    }
    
    private func infoAndAccessSection() -> some View{
        VStack(alignment: .leading, spacing: 8) {
            syncingProfilePicture()
            
            Divider()
                .padding(.horizontal, -8)
            
            managingAvatars()
            
            Divider()
                .padding(.horizontal, -8)
            
            showingLink()
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .roundedRectangleStyle(cornerRadius: 18, backgroundColor: .clear, borderColor: .colorGray, borderWidth: 1.6)
    }
    
    private func contentRectSection () -> some View{
        VStack(alignment: .leading, spacing: 8) {
            sharingProfiles()
            
            Divider()
                .padding(.horizontal, -8)
            
            facebookDatingInstagram()
            
            Divider()
                .padding(.horizontal, -8)
            
            memoriesFromInstagram()
            
            Divider()
                .padding(.horizontal, -8)
            
            mediaOnMetaDevices()
            
        }
       
        .frame(maxWidth: .infinity, alignment: .leading)
        .roundedRectangleStyle(cornerRadius: 18, backgroundColor: .clear, borderColor: .colorGray, borderWidth: 1.6)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24){
            backButton()
            
            scrollContent()
            
        }
        .padding(.top, 40)
        .padding(.horizontal, 18)
        .frame(maxWidth: .infinity, alignment: .leading)
        .navigationBarBackButtonHidden()
        .toolbar(.hidden)
        .navigationDestination(item: $router){ selection in
           routerBody(router: selection)
        }
    }
}

extension ConnectedExperienceScreen{
    enum Route: Identifiable{
        
        var id: Self { self }
        
        case accounts, sharingProfiles, facebookDatingAndInstagram, memoriesFromInstagram, mediaOnDevices, synchingProfilePictures, managingAvatars, showingLinkProfile, profileSuggestions, followingPeopleMetaHorizon
    }
    
    @ViewBuilder
    func routerBody(router: Route) -> some View{
        switch router{
        case .accounts:
            EmptyView()
            
        case .sharingProfiles:
            SharingProfilesScreen()
            
        case .facebookDatingAndInstagram:
            EmptyView()
            
        case .memoriesFromInstagram:
            EmptyView()
            
        case .mediaOnDevices:
            EmptyView()
            
        case .synchingProfilePictures:
            EmptyView()
            
        case .managingAvatars:
            EmptyView()
            
        case .showingLinkProfile:
            EmptyView()
            
        case .profileSuggestions:
            EmptyView()
            
        case .followingPeopleMetaHorizon:
            EmptyView()
        }
    }
}

