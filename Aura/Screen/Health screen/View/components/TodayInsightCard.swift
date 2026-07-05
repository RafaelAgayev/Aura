//
//  TodayInsightCard.swift
//  Aura
//
//  Created by Rafael Agayev on 25.12.25.
//

import SwiftUI

struct TodayInsightCard: View {
    
    let text: String
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8){
            Text("Today's insight")
                .font(.headline)
            
            Text(text)
                .font(.subheadline)
                
        }
        .padding()
    }
}

//#Preview {
//    TodayInsightCard()
//}
