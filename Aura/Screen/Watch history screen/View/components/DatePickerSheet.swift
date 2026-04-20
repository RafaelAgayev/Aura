//
//  DatePickerSheet.swift
//  Aura
//
//  Created by Rafael Agayev on 16.04.26.
//

import SwiftUI

struct DatePickerSheet: View {
    
    @Binding var date: Date
    
    @State private var tempDate: Date
    
    init(date: Binding<Date>){
        self._date = date
        _tempDate = State(initialValue: date.wrappedValue)
    }
    
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        
        VStack{
            DatePicker("", selection: $tempDate)
                .datePickerStyle(.graphical)
            
            Button("Done"){
                date = tempDate
                dismiss()
            }
            .foregroundStyle(.colorWhite)
            .padding(.vertical, 12)
            .padding(.horizontal)
            .frame(maxWidth: .infinity)
            .roundedRectangleStyle(cornerRadius: 12, backgroundColor: .colorGreenWhatsapp, borderColor: .colorGreenWhatsapp.opacity(0.3), borderWidth: 1.5)
           
        }
        .padding(.horizontal, 16)
    }
}

