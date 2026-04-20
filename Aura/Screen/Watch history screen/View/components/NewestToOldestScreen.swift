//
//  NewestToOldestScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 15.04.26.
//

import SwiftUI

struct NewestToOldestScreen: View {
    
    
    
    @Binding var change: WatchHistoryViewModel.SortType
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 8){
            
            Text("Sort by")
                .fontModifier(size: 16, weight: .bold, foregroundColor: .colorWhite)
            
            Divider()
            
            newest
            
            oldest
        }
    }
    
    
    private var newest: some View{
        HStack{
            Text("Newest to oldest")
                .fontModifier(size: 12, weight: .semibold, foregroundColor: .primary)
            
            Spacer()
            
            Circle()
                .stroke(style: .init(lineWidth: 1.5))
                .fill(.colorWhite)
                .frame(width: 20, height: 20)
                .overlay {
                    if change == .newest{
                        Circle()
                            .frame(width: 12.4, height: 12.4)
                            .foregroundStyle(.colorWhite)
                    }
                }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            
            change = .newest
            dismiss()
        }
        .padding(.horizontal, 8)
    }
    
    private var oldest: some View{
        HStack{
            Text("Oldest to newest")
                .fontModifier(size: 12, weight: .semibold, foregroundColor: .colorWhite)
            
            Spacer()
            
            Circle()
                .stroke(style: .init(lineWidth: 1.5))
                .fill(.colorWhite)
                .frame(width: 20, height: 20)
                .overlay {
                    if change == .oldest{
                        Circle()
                            .frame(width: 12.4, height: 12.4)
                            .foregroundStyle(.colorWhite)
                    }
                }
        }
        .padding(.horizontal, 8)
        .contentShape(Rectangle())
        .onTapGesture {
            change = .oldest
            dismiss()
        }
    }
}

extension NewestToOldestScreen{
    enum sortType: String{
        case newest, oldest
    }
}

