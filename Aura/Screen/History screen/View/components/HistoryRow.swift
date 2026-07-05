//
//  HistoryRow.swift
//  Aura
//
//  Created by Rafael Agayev on 27.12.25.
//

import SwiftUI
import CoreData

struct HistoryRow: View {
    
    let item: HistoryEntity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5){
            Text(item.title ?? "no title")
                .font(.headline)
                .foregroundStyle(.primary)
            
            Text(item.subtitle ?? "no subtitle")
                .fontModifier(size: 15, weight: .semibold, foregroundColor: .primary)
            if let date = item.date{
                Text(date.formatted(date: .abbreviated, time: .shortened))
                    .font(.subheadline)
                    .foregroundStyle(.primary)
            }
        }
        .padding(.vertical, 4)
    }
}

//#Preview {
//    HistoryRow()
//}
