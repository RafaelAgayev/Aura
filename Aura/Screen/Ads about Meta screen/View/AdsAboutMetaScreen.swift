//
//  AdsAboutMetaScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 08.06.26.
//

import SwiftUI

struct AdsAboutMetaScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Environment(\.colorScheme) private var colorScheme
    
    @State private var selectIndex: Int? = 0
    
    private var closeButton: some View{
        Image(systemName: "chevron.left")
            .foregroundStyle(colorScheme == .dark ? .colorWhite : .colorBlack)
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation{
                    dismiss()
                }
            }
    }
    
    private var header: some View{
        Text("Ads about Meta on other platforms")
            .fontModifier(size: 22, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
    }
    
    private var title: some View{
        Text("You can choose if we use your activity on Meta technologies to show you ads about Meta on other platforms")
            .fontModifier(size: 16, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
    }
    
    private var subtitle: some View{
        Text("If you choose not to let us use this activity, you may still see ads about Meta on other platforms, but they won't be shown to you by using this activity.")
            .fontModifier(size: 16, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
    }
    
    private var mainComponents: some View{
        VStack(alignment: .leading, spacing: 12){
            AdsMetaItemView(
                title: "Use my activity to show me ads about Meta",
                subtitle: "Use my activity on Meta technologies to show me ads about Meta on other platforms",
                isSelected: selectIndex == 0,
                onTap: {
                    withAnimation(.easeInOut(duration: 0.2)){
                        selectIndex = 0
                    }
                }
            )
            
            Divider()
                .padding(.horizontal, -10)
            
            AdsMetaItemView(
                title: "Don't use my activity to show me ads about Meta",
                subtitle: "Don't use my activity on Meta technologies to show me ads about Meta on other platforms",
                isSelected: selectIndex == 1,
                onTap: {
                    withAnimation(.easeInOut(duration: 0.2)){
                        selectIndex = 1
                    }
                }
            )
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 18)
        .frame(maxWidth: .infinity, alignment: .leading)
        .roundedRectangleStyle(cornerRadius: 18, backgroundColor: .clear, borderColor: .colorGray, borderWidth: 1.5)
    }
    
    private var confirmButton: some View{
        VStack(alignment: .leading, spacing: 12){
            if selectIndex == 1 {
                Divider()
                    .padding(.horizontal, -12)
                
                Button{
                    
                }label: {
                    Text("Confirm")
                        .fontModifier(size: 15, weight: .medium, foregroundColor: .colorWhite)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                .roundedRectangleStyle(cornerRadius: 22, backgroundColor: .blueRay, borderColor: .clear, borderWidth: 0)
            }
        }
    }
    
    private var headerText: some View{
        VStack(alignment: .leading, spacing: 10){
            header
            
            title
            
            subtitle
        }
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 24){
            closeButton
            
            headerText
            
            mainComponents
            
            Spacer()
            
            confirmButton
            
        }
        .padding(.top, 50)
        .padding(.horizontal, 14)
        .toolbar(.hidden)
        .frame(maxWidth: .infinity, alignment: .leading)
        .navigationBarBackButtonHidden()
    }
}
