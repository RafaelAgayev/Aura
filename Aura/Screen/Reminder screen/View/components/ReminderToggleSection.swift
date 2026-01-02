//
//  ReminderToggleSection.swift
//  Aura
//
//  Created by Rafael Agayev on 02.01.26.
//

import SwiftUI

struct ReminderToggleSection: View {
    
    @Binding var isEnabled: Bool
    
    var body: some View {
        Section{
            Toggle("Enable reminder", isOn: $isEnabled)
        }
    }
}


