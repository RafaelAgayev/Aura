//
//  SocialInteractionsScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 08.06.26.
//

import SwiftUI

struct SocialInteractionsScreen: View {
    
    @Environment(\.colorScheme) private var colorScheme
    
    @Environment(\.dismiss) private var dismiss
    
    @StateObject private var vm: SocialInteractionsViewModel = .init()
    
    private var closeButton: some View{
        Button{
            dismiss()
        }label: {
            Image(systemName: "chevron.left")
                .foregroundStyle(colorScheme == .dark ? .colorWhite : .colorBlack)
        }
    }
    
    private var headerText: some View{
        Text("Social Interactions")
            .fontModifier(size: 22, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
    }
    
    private var title: some View{
        Text("""
            We may include your social interactions alongside ads that your friends see. Social interactions include Page likes, accounts tags, app usage, event responses and more. For example, if you like a Page that's running an ad, we might let your friends know that you liked the Page when they see the ad. You can decide whether your friends can see your social interactions alongside the ads they see.
            """)
        .fontModifier(size: 16, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
        .multilineTextAlignment(.leading)
        .lineLimit(9)
    }
    
    private var subtitle: some View{
        Text("This does not include reactions to the ad itself. If you react to an ad, your friends will still be able to see that activity")
            .fontModifier(size: 16, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            .multilineTextAlignment(.leading)
            .lineLimit(3)
    }
    
    private var grayText1: some View {
        (
            Text("Social Interactions are not shown alongside ads about social issues, elections or politics that have a label showing who paid for the ad. ")
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.colorGray) +
            Text("[Learn more](https://www.meta.com)")
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.backgroundBlue)
        )
        .multilineTextAlignment(.leading)
    }
    
    private var grayText2: some View{
        Text("If you are under 18, your social interactions are not shown alongside any ads. Changing who can see your social interactions will not have an effect until you're 18 years old.")
            .fontModifier(size: 14, weight: .medium, foregroundColor: .colorGray)
    }
    
    private var textComponents: some View{
        VStack(alignment: .leading, spacing: 12){
            title
            
            subtitle
            
            grayText1
            
            grayText2
        }
    }
    
    private var accounts: some View{
        VStack(spacing: 0){
            ForEach(Array($vm.model.enumerated()), id: \.element.id) { index, $model in
                VStack(alignment: .leading, spacing: 14){
                    SocialWebsSection(
                        profilImg: model.profilImg,
                        socialWebIcon: model.socialWebIcon,
                        username: model.userName,
                        socialWebName: model.socialWebName
                    )
                    
                    if index != vm.model.count - 1 {
                        Divider()
                            .padding(.horizontal, -8)
                            .padding(.bottom, 12)
                    }
                }
                
            }
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .roundedRectangleStyle(cornerRadius: 18, backgroundColor: .clear, borderColor: .colorGray, borderWidth: 1.5)
    }
    
    private var selectAccount: some View{
        VStack(alignment: .leading, spacing: 10){
            Text("Select an account")
                .fontModifier(size: 18, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            accounts
           
        }
    }
    
    private var whyAmINotSeeing: some View{
        VStack(spacing: 0) {
            if let url = URL(string: "https://www.horizont.com"){
                Link("Why am I not seeing of all my accounts?", destination: url)
                    .fontModifier(size: 14, weight: .medium, foregroundColor: .blueRay)
            }
        }
    }
    
    private var scrollContent: some View{
        ScrollView{
            VStack(alignment: .leading, spacing: 16){
                headerText
                
                textComponents
                
                selectAccount
                
                whyAmINotSeeing
                
            }
        }
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            closeButton
            
            scrollContent
        }
        .padding(.top, 30)
        .padding(.horizontal, 12)
        .toolbar(.hidden)
        .navigationBarBackButtonHidden()
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
