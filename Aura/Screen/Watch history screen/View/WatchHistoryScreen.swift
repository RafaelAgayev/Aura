//
//  WatchHistoryScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 06.01.26.
//

import SwiftUI

struct WatchHistoryScreen: View {
    
    @State private var navigation: Navigation?
    
    @Environment(\.dismiss) private var dismiss
    
    @Environment(\.showLoading) private var showLoading
    
    @Environment(\.hideLoading) private var hideLoading
    
    @StateObject private var vm = WatchHistoryViewModel()
    
    
    
    var body: some View {
        VStack(spacing: 8){
            header
            
            ScrollView{
                
            }
        }
        .navigationBarBackButtonHidden()
        .sheet(item: $navigation) { id in
            switch id{
            case .newest:
                NewestToOldestScreen(change: Binding(get: { vm.sort}, set: { vm.sort = $0 }))
                    .presentationCornerRadius(12)
                    .presentationDragIndicator(.visible)
                    .presentationDetents([.fraction(0.2)])
            case .allDates:
                AllDatesScreen(
                    dates: Binding(
                        get: { vm.dateFilter },
                        set: { vm.dateFilter = $0 }
                    ),
                    startDate: Binding(
                        get: { vm.startDate },
                        set: { if let time = $0 { vm.setStartDate(time) } }
                    ),
                    endDate: Binding(
                        get: { vm.endDate },
                        set: { if let time = $0 { vm.setEndDate(time) } }
                    ),
                    showRange: $vm.showRange
                )
                    .presentationCornerRadius(12)
                    .presentationDragIndicator(.visible)
                    .presentationDetents([.height(200)])
           
            case .allAuthors:
                EmptyView()
            }
        }
    }
    
    private var header: some View{
        VStack(alignment: .leading, spacing: 12) {
            HStack{
                Button{
                    dismiss()
                }label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.primary)
                }
                Spacer()
                
                Text("Watch history")
                    .fontModifier(size: 14, weight: .semibold, foregroundColor: .primary)
                
                Spacer()
                
                Button{
                    
                }label: {
                    Text("Select")
                        .fontModifier(size: 14, weight: .medium, foregroundColor: .colorBlue)
                }
            }
            .padding(.horizontal, 8)
            
            Divider()
            
            HStack(spacing: 2) {
                
                newestSheet
                
                allDatesSheet
            }
        }
    }
    
    private var newestSheet: some View{
        Button{
            navigation = nil
            DispatchQueue.main.async {
                
                navigation = .newest
            }
        }label: {
            HStack(spacing: 3){
                Text(vm.sort == .newest ? "Newest to oldest" : "Oldest to newest")
                    .fontModifier(size: 8, weight: .semibold, foregroundColor: .colorWhite)
                
                Image(systemName: "chevron.down")
                    .fontModifier(size: 8, weight: .semibold, foregroundColor: .colorWhite)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 12)
            .roundedRectangleStyle(cornerRadius: 8, backgroundColor: .colorGray.opacity(0.4), borderColor: .clear, borderWidth: 0)
        }

        .padding(.horizontal, 20)
    }
    
    private var allDatesSheet: some View{
        HStack(spacing: 3) {
            Text(vm.dateTitle)
                .fontModifier(size: 8, weight: .semibold, foregroundColor: .colorWhite)
            
            Image(systemName: "chevron.down")
                .fontModifier(size: 8, weight: .semibold, foregroundColor: .colorWhite)
        }
        .onTapGesture {
            navigation = nil
            DispatchQueue.main.async {
                
                navigation = .allDates
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 12)
        .roundedRectangleStyle(cornerRadius: 8, backgroundColor: .colorGray.opacity(0.4), borderColor: .clear, borderWidth: 0)
    }
}

extension WatchHistoryScreen{
    enum Navigation: Identifiable{
        case newest, allDates, allAuthors
        
        var id: String{
            switch self {
            case .newest:
                return "newest"
            case .allDates:
                return "allDates"
            case .allAuthors:
                return "allAuthors"
            }
        }
    }
}


