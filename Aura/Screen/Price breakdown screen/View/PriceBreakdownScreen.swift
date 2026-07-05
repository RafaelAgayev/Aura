//
//  PriceBreakdownScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 04.06.26.
//

import SwiftUI

struct PriceBreakdownScreen: View {
    
    @Environment(\.colorScheme) private var colorScheme
    
    @Environment(\.dismiss) private var dismiss
    
    @Environment(\.showLoading) private var showLoading
    
    @Environment(\.hideLoading) private var hideLoading
    
    @State private var selectSegment: SegmentCommand = .today
    
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
                                .fill(selectSegment == segment ? (colorScheme == .dark ? .colorWhite : .colorBlack) : .clear)
                                .frame(height: 2)
                        }
                        .frame(maxWidth: .infinity)
                        .contentShape(Rectangle())
                        .onTapGesture{
                            withAnimation(.spring(duration: 0.15)){
                                selectSegment = segment
                            }
                        }
                    }
                
                
            }
        }
    }
    
    
    
    private var closeButton: some View{
        Image(colorScheme == .dark ? .iconXMarkColored : .iconXMark)
            .resizable()
            .scaledToFill()
            .frame(width: 20, height: 20)
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation{
                    dismiss()
                }
            }
    }
    
    private var headerTitle: some View{
        Text("Price breakdown")
            .fontModifier(size: 20, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
    }
    
    private var todayComponent: some View{
        VStack(alignment: .leading, spacing: 8){
            HStack{
                Text("2 profiles")
                    .fontModifier(size: 14, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
                
                Spacer()
                
                Text("$15.38")
                    .fontModifier(size: 14, weight: .medium, foregroundColor: .colorGray)
            }
            
            Divider()
                .padding(.horizontal, -4)
            
            HStack{
                Text("$0.79 welcome offer")
                    .fontModifier(size: 14, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
                
                Spacer()
                
                Text("-$14.59")
                    .fontModifier(size: 14, weight: .medium, foregroundColor: .colorRed)
            }
            
            Divider()
                .padding(.horizontal, -2)
            
            HStack{
                Text("Total")
                    .fontModifier(size: 14, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
                Spacer()
                
                Text("$0.79")
                    .fontModifier(size: 14, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            }
        }
        .padding(.horizontal, 22)
    }
    
    private var after1Month: some View{
        VStack(alignment: .leading, spacing: 8){
            HStack{
                Text("2 profiles")
                    .fontModifier(size: 14, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
                
                Spacer()
                
                Text("$15.38")
                    .fontModifier(size: 14, weight: .medium, foregroundColor: .colorGray)
                
            }
            
            Divider()
                .padding(.horizontal, -4)
            
            HStack{
                Text("Bundle discount")
                    .fontModifier(size: 14, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
                
                Spacer()
                
                Text("-$2.89")
                    .fontModifier(size: 14, weight: .medium, foregroundColor: .colorRed)
                
            }
            
            Divider()
                .padding(.horizontal, -4)
            
            HStack{
                Text("Total")
                    .fontModifier(size: 14, weight: .medium, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
                
                Spacer()
                
                Text("$12.49/month")
                    .fontModifier(size: 16, weight: .semibold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
            }
        }
        .padding(.horizontal, 22)
    }
    
    private var selectSegmentIndex: some View{
        VStack(spacing: 0){
            switch selectSegment {
            case .today:
                todayComponent
            case .after1Month:
                after1Month
            }
        }
    }
    
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 18){
                closeButton
                
                headerTitle
                
                segment
                
                selectSegmentIndex
                
                Spacer()
                
            }
            Spacer()
        }
        .padding(.vertical, 40)
        .padding(.horizontal, 16)
    }
}

extension PriceBreakdownScreen{
    enum SegmentCommand: String, CaseIterable{
        case today = "Today"
        case after1Month = "After 1 month"
    }
}
