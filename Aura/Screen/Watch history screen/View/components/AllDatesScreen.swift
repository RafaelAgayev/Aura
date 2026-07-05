//
//  AllDatesScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 15.04.26.
//

import SwiftUI

struct AllDatesScreen: View {
    
    @Binding var dates: WatchHistoryViewModel.DateFilter
    
    @Environment(\.dismiss) private var dismiss
    
    @Environment(\.colorScheme) private var colorScheme
    
    @Binding var startDate: Date?
    
    @Binding  var endDate: Date?
    
    @Binding var showRange: Bool
    
    
    var body: some View {
        VStack(spacing: 8) {
            Text("Filter by date")
                .fontModifier(size: 12, weight: .semibold, foregroundColor: .colorWhite)
            
            Divider()
            
            VStack(spacing: 16) {
                allDates
                
                pastWeek
                
                pastMonth
                
                dateRange
                
                
            }
            .padding(.horizontal, 8)
        }
        .sheet(isPresented: $showRange) {
            DateRangeScreen(
                
                startDate: Binding(get: { startDate}, set: { startDate = $0 ?? .distantFuture}),
                endDate: Binding(get: { endDate}, set: { endDate = $0 ?? .distantPast}))
                .presentationDetents([.fraction(0.3)])
                .presentationDragIndicator(.visible)
                .presentationCornerRadius(12)
        }
        
        .padding(.top, 0)
        .padding(.bottom, 0)
    }
    
    private var allDates: some View{
        HStack{
            Text("All dates")
                .fontModifier(size: 12, weight: .medium, foregroundColor: .colorWhite)
            
            Spacer()
            
            Circle()
                .stroke(style: .init(lineWidth: 1.5))
                .fill(.colorWhite)
                .frame(width: 20, height: 20)
                .overlay {
                    if dates == .all{
                        Circle()
                            .fill(.colorWhite)
                            .frame(width: 12.4, height: 12.4)
                    }
                }
            
        }
        
        .contentShape(Rectangle())
        .onTapGesture {
            dates = .all
            dismiss()
        }
    }
    
    private var pastWeek: some View{
        HStack{
            Text("Past week")
                .fontModifier(size: 12, weight: .medium, foregroundColor: .colorWhite)
            
            Spacer()
            
            Circle()
                .stroke(style: .init(lineWidth: 1.5))
                .fill(.colorWhite)
                .frame(width: 20, height: 20)
                .overlay {
                    if dates == .pastWeek{
                        Circle()
                            .fill(.colorWhite)
                            .frame(width: 12.4, height: 12.4)
                    }
                }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            dates = .pastWeek
            dismiss()
        }
        
    }
    
    private var pastMonth: some View{
        HStack{
            Text("Past month")
                .fontModifier(size: 12, weight: .medium, foregroundColor: .colorWhite)
            
            Spacer()
            
            Circle()
                .stroke(style: .init(lineWidth: 1.5))
                .fill(.colorWhite)
                .frame(width: 20, height: 20)
                .overlay {
                    if dates == .pastMonth{
                        Circle()
                            .fill(.colorWhite)
                            .frame(width: 12.4, height: 12.4)
                    }
                }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            dates = .pastMonth
            dismiss()
        }
    }
    
    private var dateRange: some View{
        HStack{
            Text("Date range")
                .fontModifier(size: 12, weight: .medium, foregroundColor: .colorWhite)
            
            Spacer()
            
            Image(systemName: "chevron.right")
        }
        .contentShape(Rectangle())
        .onTapGesture {
            showRange = true
        }
    }
}

