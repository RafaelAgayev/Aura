//
//  ReminderTimeSection.swift
//  Aura
//
//  Created by Rafael Agayev on 02.01.26.
//

import SwiftUI

struct ReminderTimeSection: View {
    
    @Binding var isEnabled: Bool
    
    @Binding var reminderTime: Date
    var body: some View {
        Section(header: Text("Time")) {
            
            DatePicker(
                "Reminder time",
                selection: $reminderTime,
                displayedComponents: .hourAndMinute
            )
            .disabled(!isEnabled)
        }
    }
}
