//
//  AdsInOtherAppsScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 08.06.26.
//

import SwiftUI

struct AdsInOtherAppsScreen: View {
    
    @Environment(\.colorScheme) private var colorScheme
    
    @Environment(\.dismiss) private var dismiss
    
    @StateObject private var vm: AdsOtherAppsViewModel = .init()
    
    @State private var selectIndex: Int? = 0
    
    private var closeButton: some View{
        Image(systemName: "chevron.left")
            .foregroundStyle(colorScheme == .dark ? .colorWhite : .colorBlack)
            .onTapGesture {
                withAnimation{
                    dismiss()
                }
            }
    }
    
    private var headerTitle: some View{
        Text("Ads in other apps.")
            .fontModifier(size: 22, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
    }
    
    private var audienceNetworkText: some View{
        Text("You can choose whether you see ads from Meta Audience Network in other apps.")
            .fontModifier(size: 16, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            .multilineTextAlignment(.leading)
    }
    
    private var forExampleText: some View{
        (
            Text("For example, we can show you an ad from one of our ad partners in a different company's gaming app. ")
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(colorScheme == .dark ? .colorWhite : .colorBlack) +
            Text("[Learn more](https://www.greenland.com)")
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(.backgroundBlue)
        )
    }
    
    private var mainContent: some View{
        VStack(alignment: .leading, spacing: 12){
            AdsOtherAppsItemView(
                title: "Allow us to show you ads in other apps",
                subtitle: "Discover products and brands through ads in other apps.",
                isSelected: selectIndex == 0,
                onTap: {
                    selectIndex = 0
                })
            
            Divider()
                .padding(.horizontal, -8)
            
            AdsOtherAppsItemView(
                title: "Don't allow us to show you ads in other apps",
                subtitle: "You may still see the same number of ads, but these ads won't be shown by Meta.",
                isSelected: selectIndex == 1,
                onTap: {
                selectIndex = 1
            })
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 18)
        .frame(maxWidth: .infinity, alignment: .leading)
        .roundedRectangleStyle(cornerRadius: 18, backgroundColor: .clear, borderColor: .colorGray, borderWidth: 1.5)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 22){
            closeButton
            
            headerTitle
            
            audienceNetworkText
            
            forExampleText
            
            mainContent
            
            Spacer()
        }
        .toolbar(.hidden)
        .navigationBarBackButtonHidden()
        .padding(.horizontal, 14)
        .padding(.top, 30)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
