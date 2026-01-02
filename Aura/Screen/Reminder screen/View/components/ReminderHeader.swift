//
//  ReminderHeader.swift
//  Aura
//
//  Created by Rafael Agayev on 02.01.26.
//

import SwiftUI

struct ReminderHeader: View {
    var body: some View {
        Section("Get daily"){
            Text("Get daily reminders to check your mood and health.")
                .font(.subheadline)
                .foregroundStyle(.colorBlack)
        }
    }
}

#Preview {
    ReminderHeader()
}
