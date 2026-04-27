//
//  ReminderHeader.swift
//  Aura
//
//  Created by Rafael Agayev on 02.01.26.
//

import SwiftUI

struct ReminderHeader: View {
    
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        Section("Get daily"){
            Text("Get daily reminders to check your mood and health.")
                .font(.subheadline)
                .foregroundStyle(colorScheme == .dark ? .colorWhite : .colorBlack)
        }
    }
}

#Preview {
    ReminderHeader()
}
