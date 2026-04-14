//
//  RecentSearchesSection.swift
//  Aura
//
//  Created by Rafael Agayev on 12.01.26.
//

import SwiftUI

struct RecentSearchesSection: View {
    
    @Binding var searchText: String
    
    var onUpdate: () -> Void
    
    var body: some View {
        TextField("Search", text: $searchText)
            .onChange(of: searchText) { _, _ in
                onUpdate()
            }
            .padding(.horizontal, 4)
            .padding(.vertical, 8)
            .roundedRectangleStyle(cornerRadius: 12, backgroundColor: .colorGray, borderColor: .colorBlack.opacity(0.55), borderWidth: 1.5)
        
    }
}
