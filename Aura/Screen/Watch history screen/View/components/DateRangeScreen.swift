//
//  DateRangeScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 16.04.26.
//

import SwiftUI

struct DateRangeScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var picker: Picker?
    
    @Binding var startDate: Date?
    
    @Binding var endDate: Date?
    
    @State private var tempStartDate: Date?
    
    @State private var tempEndDate: Date?
    
    
    init(startDate: Binding<Date?>, endDate: Binding<Date?>) {
        _startDate = startDate
        _endDate = endDate
        
        _tempStartDate = State(initialValue: startDate.wrappedValue)
        _tempEndDate = State(initialValue: endDate.wrappedValue)
    }

    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            header
            
            Divider()
            
            dateTime
            
            Divider()
            
            applyButton
        }
        .padding(.horizontal, 12)
        .sheet(item: $picker){ id in
            switch id{
            case .startDate:
                DatePickerSheet(date: Binding(get: { tempStartDate ?? Date() }, set: { tempStartDate = $0}))
            case .endDate:
                DatePickerSheet(date: Binding(get: { tempEndDate ?? Date()}, set: { tempEndDate = $0}))
            }
        }
        
    }
    
    private var dateTime: some View{
        VStack(spacing: 6){
            dateRow(title: "Start Date", date: tempStartDate) {
                picker = .startDate
                
            }
            
            
            dateRow(title: "End Date", date: tempEndDate) {
                picker = .endDate
            }
        }
    }
    
    private var header: some View{
        HStack{
            Image(systemName: "chevron.left")
                .onTapGesture {
                    dismiss()
                }
            Spacer()
            
            Text("Date range")
                .fontModifier(size: 16, weight: .semibold, foregroundColor: .colorWhite)
            
            Spacer()
            
            
        }
    }
    
    private func dateRow(title: String, date: Date?, action: @escaping () -> Void) -> some View{
        HStack{
            Text(title)
                .fontModifier(size: 12, weight: .medium, foregroundColor: .colorWhite)
            
            Spacer()
            
            HStack(spacing: 4){
                Text(date != nil ? formatted(date!) : "")
                    .fontModifier(size: 12, weight: .medium, foregroundColor: .colorWhite)
                
                Image(systemName: "chevron.right")
                
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            action()
        }
    }
    func formatted(_ date: Date) -> String{
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: date)
    }
    
    private var applyButton: some View{
        Button{
            startDate = tempStartDate
            endDate = tempEndDate
            dismiss()
        }label: {
            Text("Apply")
                .padding(.top, 8)
                .foregroundStyle(.colorWhite)
                .padding(.vertical, 8)
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
                .roundedRectangleStyle(cornerRadius: 8, backgroundColor: .colorBlue, borderColor: .clear, borderWidth: 0)
                .disabled(
                    tempStartDate == nil ||
                    tempEndDate == nil ||
                    (tempStartDate! > tempEndDate!)
                )
                .opacity(
                    (tempStartDate == nil || tempEndDate == nil || tempStartDate! > tempEndDate!) ? 0.5 : 1
                )
        }
        .contentShape(Rectangle())
        
    }
    
}


extension DateRangeScreen{
    enum Picker: Identifiable{
        case startDate, endDate
        
        var id: String{
            switch self {
            case .startDate:
                return "Start Date"
            case .endDate:
                return "End Date"
            }

        }
    }
}
