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
            
            Text(item.subtitle ?? "no subtitle")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .fontModifier(size: 15, weight: .semibold, foregroundColor: .colorBlack)
            if let date = item.date{
                Text(date.formatted(date: .abbreviated, time: .shortened))
                    .font(.headline)
                    .foregroundStyle(.colorGray)
            }
        }
        .padding(.vertical, 4)
    }
}

//#Preview {
//    HistoryRow()
//}
