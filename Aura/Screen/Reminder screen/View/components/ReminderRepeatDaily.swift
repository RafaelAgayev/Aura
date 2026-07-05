//
//  ReminderRepeatDaily.swift
//  Aura
//
//  Created by Rafael Agayev on 02.01.26.
//

import SwiftUI

struct ReminderRepeatDaily: View {
    
    @Binding var repeatDaily: Bool
    
    @Binding var isEnabled: Bool
    
    var body: some View {
        Section(header: Text("Repeat")) {
            Toggle("Daily", isOn: $repeatDaily)
                .disabled(!isEnabled)
        }
       
    }
}

