//
//  AISuggestionsSection.swift
//  Aura
//
//  Created by Rafael Agayev on 25.12.25.
//

import SwiftUI

struct AISuggestionsSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12){
            Text("AI Suggestions")
                .font(.headline)
            
            Text("• Try getting 30 minutes of fresh air\n• Consider a short meditation\n• Drink more water today")
                .font(.subheadline)
        }
        .padding()
       
    }
}

#Preview {
    AISuggestionsSection()
}
