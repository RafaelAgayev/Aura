//
//  SaveProfilesScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 03.06.26.
//

import SwiftUI

struct SaveProfilesScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Environment(\.showLoading) private var showLoading
    
    @Environment(\.hideLoading) private var hideLoading
    
    @Environment(\.colorScheme) private var colorScheme
    
    @State private var route: Route? = nil
    
    private var backButton: some View{
        HStack{
            Image(systemName: "chevron.left")
                .foregroundStyle(colorScheme == .dark ? .colorWhite : .colorBlack)
                .frame(width: 20, height: 20)
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation{
                        dismiss()
                    }
                }
                .padding(.top, 40)
                .padding(.horizontal, 12)
            Spacer()
        }
    }
    
    private var linear: some View{
        HStack(spacing: 0){
            ForEach(0..<5) { index in
                RoundedRectangle(cornerRadius: 4)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .frame(height: 2)
                    .foregroundStyle(index == 0 || index == 1 ? .colorWhite : .colorGray.opacity(0.2))
            }
            .padding(.vertical, 4)
            .padding(.horizontal, 2)
        }
    }
    
    private var img1: some View{
        Image(.thomasShelby)
            .resizable()
            .scaledToFill()
            .frame(width: 50, height: 50)
            .clipShape(Circle())
            .overlay(alignment: .bottomTrailing) {
                Circle()
                    .fill(.colorBlack)
                    .frame(width: 24, height: 24)
                    .overlay {
                        Image(.iconInstagramColored)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 18, height: 18)
                            .clipShape(Circle())
                    }
            }
    }
    
    private var img2: some View{
        Image(.baby)
            .resizable()
            .scaledToFill()
            .clipShape(Circle())
            .frame(width: 50, height: 50)
            .overlay(alignment: .bottomTrailing) {
                Circle()
                    .fill(.colorBlack)
                    .frame(width: 24, height: 24)
                    .overlay {
                        Image(.iconFacebook)
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 18, height: 18)
                    }
            }
    }
    
    private var nickName: some View{
        VStack(alignment: .center, spacing: 8){
            HStack(spacing: 4){
                Text("r.a_rus & Rafa El")
                    .fontModifier(size: 24, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
                    
                Image(.iconMetaVerifiedBlack)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 16, height: 16)
            }
            .padding(.trailing, 20)
            
            Text("Meta Verified Standart")
                .fontModifier(size: 14, weight: .medium, foregroundColor: .colorGray)
        }
    }
    
    private var Images: some View{
        VStack(alignment: .center, spacing: 6){
            HStack{
                Spacer()
                HStack(spacing: -8){
                    img1
                        .zIndex(1)
                    
                    img2
                        .zIndex(0)
                    
                }
                Spacer()
            }
            
            nickName
        }
    }
    
    private var header: some View{
        VStack(alignment: .leading, spacing: 8){
            backButton
            
            linear
        }
    }
    
    private var mainContentMoney: some View{
        HStack(spacing: 1){
            Text("$15.38")
                .fontModifier(size: 16, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
                .strikethrough(true)
            
            Text("$0.79 for your first month")
                .fontModifier(size: 16, weight: .medium, foregroundColor: .colorGreen.opacity(0.7))
        }
    }
    
    private var mainContentText: some View{
        VStack(alignment: .leading, spacing: 12){
            VStack(alignment: .leading, spacing: 4){
                Text("Then $12.49/month until you cancel. Price may include taxes when applicable.")
                    .fontModifier(size: 16, weight: .medium, foregroundColor: .colorGray)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("2 profiles")
                    .fontModifier(size: 16, weight: .medium, foregroundColor: .colorGray)
                
                Text("$0.79 welcome offer applied")
                    .fontModifier(size: 10, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
                    .frame(maxWidth: 150)
                    .frame(height: 10)
                    .padding(.all, 4)
                    .roundedRectangleStyle(cornerRadius: 14, backgroundColor: .colorGray.opacity(0.5), borderColor: .clear, borderWidth: 0)
                
            }
            
            Divider()
                .padding(.horizontal, -8)
            
            seePriceButton
            
        }
    }
    

    private var seePriceButton: some View{
        Button{
            route = .seePrice
        }label: {
            Text("See price breakdown")
                .fontModifier(size: 18, weight: .medium, foregroundColor: .blueRay)
        }
    }
    
    private var whatYouGetComponents: some View{
        VStack(alignment: .leading, spacing: 16){
            Text("What you get with your subscription")
                .fontModifier(size: 18, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            subscriptions
            
            Text("When you have a verified badge on your profile, people may be more likely to follow you.")
                .fontModifier(size: 14, weight: .medium, foregroundColor: .colorGray)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
        }
    }
    
    private var subscriptions: some View{
        SaveProfileSubscriptions()
    }
    
    private var mainContent: some View{
        VStack(alignment: .leading, spacing: 6){
            mainContentMoney
            
            mainContentText
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .roundedRectangleStyle(cornerRadius: 14, backgroundColor: colorScheme == .dark ? .colorBlack.opacity(0.3) : .colorWhite.opacity(0.3), borderColor: .colorGray, borderWidth: 1.5)
    }
    
    private var paddingContent: some View{
        VStack(alignment: .leading, spacing: 22){
            mainContent
            
            whatYouGetComponents
        }
        .padding(.horizontal, 20)
    }
    
    private var scrollContent: some View{
        ScrollView{
            Images
            
           paddingContent
            
        }
        .zIndex(0)
    }
    
    private var bottomComponents: some View{
        
        VStack(alignment: .leading, spacing: 12){
            bottomText
            
            continueButton
        }
        .zIndex(1)
        .padding(.horizontal, 20)
    }
    
    private var bottomText: some View{
        (
            Text("By tapping Continue, you agree the")
                .foregroundStyle(.colorGray) +
            Text(" Terms of Service")
                .foregroundStyle(.blueRay) +
            Text(" apply to your Meta Verified subscriptions. You'll be enrolled in ")
                .foregroundStyle(.colorGray) +
            Text(" Advanced Protection")
                .foregroundStyle(.blueRay) +
            Text(". Cancel 24 hours before your next payment date to avoid charges.")
                .foregroundStyle(.colorGray) +
            Text(" Learn more")
                .foregroundStyle(.blueRay)
        )
        .font(.system(size: 14, weight: .medium))
        .multilineTextAlignment(.leading)
        .lineLimit(5)
    }
    
    private var continueButton: some View{
        Button{
            route = .bottomContinue
        }label: {
            Text("Continue")
                .fontModifier(size: 16, weight: .medium, foregroundColor: .colorWhite)
                .padding(.vertical, 10)
                .padding(.horizontal, 4)
                .frame(maxWidth: .infinity, alignment: .center)
        }
        .roundedRectangleStyle(cornerRadius: 18, backgroundColor: .blueRay, borderColor: .clear, borderWidth: 0)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            header
            
            scrollContent
            
            bottomComponents
            
        }
        .sheet(item: $route) { nav in
            switch nav{
            case .seePrice:
                PriceBreakdownScreen()
                    .presentationCornerRadius(24)
                    .presentationDetents([.fraction(0.4)])
                    .presentationDragIndicator(.visible)
            case .bottomContinue:
                EmptyView()
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar(.hidden)
    }
}

extension SaveProfilesScreen{
    enum Route: Identifiable{
        
        var id: Self { self }
        case seePrice, bottomContinue
    }
}

