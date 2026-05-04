//
//  PersonalScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 30.04.26.
//

import SwiftUI

struct PersonalScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Environment(\.showLoading) private var showLoading
    
    @Environment(\.hideLoading) private var hideLoading
    
    @Environment(\.colorScheme) private var colorScheme
    
    @State private var navigation: Navigation? = nil
    
    @StateObject private var vm = PersonalViewModel()
    
    
    private var backButton: some View{
        Image(systemName: "chevron.left")
            .foregroundStyle(colorScheme == .dark ? .colorWhite : .colorBlack)
            .onTapGesture {
                dismiss()
            }
    }
    
    private var headerText: some View{
        VStack(alignment: .leading, spacing: 8){
            Text("Profiles and personal details")
                .fontModifier(size: 18, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            
            Text("Review the profile and personal details you've\n added to this Accounts Center. Add more\n profiles by adding your accounts")
                .fontModifier(size: 18, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
        }
        .multilineTextAlignment(.leading)
        .lineLimit(3)
    }
    
    private var header: some View{
        VStack(alignment: .leading, spacing: 12){
            backButton
            
            headerText
        }
    }
    
    private var personalView: some View{
        VStack(alignment: .leading, spacing: 0){

            ForEach(Array($vm.model.enumerated()), id: \.element.id) { index, $profile in
                VStack(alignment: .leading, spacing: 12){
                    PersonalView(
                        profilImg: profile.profilImg,
                        socialWebIcon: profile.socialWebIcon,
                        nickName: profile.userName,
                        socialWebName: profile.socialWebName,
                        onTap: { _ in
                            navigation = .profile(profile.id)
                        }
                    )
                    
                    if index != vm.model.count - 1 {
                        Divider().padding(.horizontal, -8)
                    }
                }
               
            }
          
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .roundedRectangleStyle(cornerRadius: 12, backgroundColor: colorScheme == .dark ? .colorBlack.opacity(0.15) : .colorWhite.opacity(0.1), borderColor: colorScheme == .dark ? .colorGray : .colorBlack.opacity(0.7), borderWidth: 1.5)
    }
    
    private var personalDetails: some View{
        VStack(alignment: .leading, spacing: 12) {
            Text("Personal details")
                .fontModifier(size: 18, weight: .bold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)

            VStack(alignment: .leading, spacing: 14){
                PersonalDetailsInPersonalScreen(
                    title: "Contact info",
                    subtitle: "rafael.agayev141@gmail.com",
                    onTap: { nav in navigation = .contactInfo }
                )
                
                Divider()
                    .padding(.horizontal, -8)
                
                PersonalDetailsInPersonalScreen(
                    title: "Birthday",
                    subtitle: "May 14, 1993",
                    onTap: { nav in  navigation = .birthday }
                )
            }
            .padding(.vertical, 14)
            .padding(.horizontal, 12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .roundedRectangleStyle(cornerRadius: 12, backgroundColor: colorScheme == .dark ? .colorBlack.opacity(0.15) : .colorWhite.opacity(0.1), borderColor: colorScheme == .dark ? .colorGray : .colorBlack.opacity(0.7), borderWidth: 1.5)
        }
    }
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            header
            
            VStack(alignment: .leading, spacing: 12){
                
                Text("Profiles")
                    .fontModifier(size: 18, weight: .bold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
                personalView
                
            }
            personalDetails
            Spacer()
        }
        .padding(.top, 16)
        .padding(.horizontal, 12)
        .safeAreaPadding(.top)
        .navigationBarBackButtonHidden()
        
        .navigationDestination(item: $navigation) { route in
            switch route{
            case .profile(let id):
                if let index = vm.model.firstIndex(where: { $0.id == id }) {
                    EditProfileScreen(model: $vm.model[index])
                }
            case .addAccounts:
                EmptyView()
                
            case .birthday:
                EmptyView()
            case .contactInfo:
                EmptyView()
            }
        }
    }
}

extension PersonalScreen{
    enum Navigation: Hashable, Identifiable{
        case profile(UUID)
        case addAccounts, contactInfo, birthday
        
        var id: String {
            switch self {
            case .profile(let id): return id.uuidString
            case .addAccounts: return "add Accounts"
            case .contactInfo: return "contact"
            case .birthday: return "birthday"
            }
        }
    }
}

