//
//  AdPrefencesScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 30.04.26.
//

import SwiftUI

struct AdPrefencesScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Environment(\.colorScheme) private var colorScheme
    
    @Environment(\.hideLoading) private var hideLoading
    
    @Environment(\.showLoading) private var showLoading
    
    @State private var selectSegment: SegmentCommand = .customizeAds
    
    @State private var selectRoute: Route? = nil
    
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
    
    private var segment: some View{
        VStack(spacing: 0){
            HStack(spacing: 0){
                ForEach(SegmentCommand.allCases, id: \.self) { segment in
                    VStack(spacing: 6){
                        Text(segment.rawValue)
                            .fontModifier(size: 14, weight: selectSegment == segment ? .semibold : .medium, foregroundColor: selectSegment == segment ? (colorScheme == .dark ? .colorWhite : .colorBlack) : .colorGray)
                            .tag(segment)
                            .background(.clear)
                        
                        Rectangle()
                            .fill(selectSegment == segment ? .colorWhite : .clear)
                            .frame(height: 2)
                    }
                    .contentShape(Rectangle())
                    .frame(maxWidth: .infinity)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.15)){
                            selectSegment = segment
                        }
                    }
                }
            }
        }
    }
    
    private var segmentView: some View{
        ScrollView{
            VStack(spacing: 0){
                switch selectSegment {
                case .customizeAds:
                    EmptyView()
                case .manageInfo:
                    manageInfoComponents
                }
            }
        }
    }
    
    private var manageInfoComponents: some View{
        VStack(alignment: .leading, spacing: 16){
            information
            
            adsShownMeta
            
            otherSettings
            
            learnMoreAboutAdsPrivacy
            
            scrollHorizontalContent
            
            bottomButtons
        }
    }
    
    private var segmentControl: some View{
        VStack(alignment: .leading, spacing: 14){
            segment
            
            segmentView
        }
    }
    
    private var information: some View{
        InformationUsedToShowYouAds { route in
            selectRoute = route
            
        }
        
    }
    private var adsShownMeta: some View{
        AdsShownMeta { route in
            selectRoute = route
        }
    }
    
    private var otherSettings: some View{
        OtherSettings{ route in
            selectRoute = route
        }
    }
    
    private var learnMoreAboutAdsPrivacy: some View{
        VStack(alignment: .leading, spacing: 8){
            Text("Learn more about ads privacy")
                .fontModifier(size: 18, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            
            Text("Find out more about what information is used to show you ads, and how you can control your privacy.")
                .fontModifier(size: 14, weight: .medium, foregroundColor: .colorGray)
        }
    }
    
    private var whatInformationShowAds: some View{
        WhatInformationUsedToShowAds{ route in
            selectRoute = route
        }
    }
    
    private var doesMetaSell: some View{
        DoesMetaSell{ route in
            selectRoute = route
        }
    }
    
    private var learnMorePrivacyCenter: some View{
        Button{
            
        }label: {
            Text("Learn more in Privacy Center")
                .fontModifier(size: 18, weight: .semibold, foregroundColor: .colorGray)
                .padding(.vertical, 8)
                .contentShape(Rectangle())
                .frame(maxWidth: .infinity, alignment: .center)
        }
       
        .roundedRectangleStyle(cornerRadius: 22, backgroundColor: .colorBlack.opacity(0.5), borderColor: .clear, borderWidth: 0)
    }
    
    private var learnMoreInstagramAds: some View{
        Button{
            
        }label: {
            Text("Learn more about Instagram ads")
                .fontModifier(size: 18, weight: .semibold, foregroundColor: .colorGray)
                .padding(.vertical, 8)
                .contentShape(Rectangle())
                .frame(maxWidth: .infinity, alignment: .center)
            
        }
       
        .roundedRectangleStyle(cornerRadius: 22, backgroundColor: .colorBlack.opacity(0.2), borderColor: .clear, borderWidth: 0)
    }
    
    private var bottomButtons: some View{
        VStack(alignment: .leading, spacing: 8){
            learnMorePrivacyCenter
            
            learnMoreInstagramAds
        }
    }
    
    private var scrollHorizontalContent: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                whatInformationShowAds
                    .frame(width: UIScreen.main.bounds.width - 32)
                
                doesMetaSell
                    .frame(width: UIScreen.main.bounds.width - 32)
            }
        }
        .frame(height: 250)
    }
    
    private var headerTitle: some View{
        VStack(alignment: .leading, spacing: 8){
            Text("Ad preferences")
                .fontModifier(size: 22, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            
            Text("Take control of your ad experince and the information used to show you ads.")
                .multilineTextAlignment(.leading)
                .fontModifier(size: 16, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
        }
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 18){
            closeButton
            
            headerTitle
            
            segmentControl
            
            Spacer()
        }
        .navigationDestination(item: $selectRoute){ navigation in
            switch navigation{
                
            case .categoriesUsed:
                CategoriesUsedScreen()
                
            case .activityInformation:
                ActivityInformationScreen()
                
            case .audienceBased:
                AudienceBasedScreen()
                
            case .adsInOtherApps:
                AdsInOtherAppsScreen()
                
            case .adsAboutMeta:
                AdsAboutMetaScreen()
                
            case .socialInteractions:
                SocialInteractionsScreen()
                
            case .whatInformationAds:
                WhatInformationAdsScreen()
                
            case .doesMetaSell:
                DoesMetaSellScreen()
            }
        }
        .padding(.top, 40)
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .navigationBarBackButtonHidden()
        .toolbar(.hidden)
    }
}

extension AdPrefencesScreen{
    enum SegmentCommand: String, CaseIterable{
        
        case customizeAds = "Customize ads"
        case manageInfo = "Manage info"
    }
    
    enum Route: Identifiable{
        var id: Self { self }
        
        case categoriesUsed,
             activityInformation,
             audienceBased,
             adsInOtherApps,
             adsAboutMeta,
             socialInteractions,
             whatInformationAds,
             doesMetaSell
    }
}
