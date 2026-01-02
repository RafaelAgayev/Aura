//
//  SaveSection.swift
//  Aura
//
//  Created by Rafael Agayev on 02.01.26.
//

import SwiftUI

struct SaveSection: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var onSave: () -> Void
    var body: some View {
        Section {
            Button{
                onSave()
                dismiss()
            }label: {
                Text("Save reminder")
            }
        }
    
    }
}

