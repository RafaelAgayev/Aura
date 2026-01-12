//
//  RecentSearchesSection.swift
//  Aura
//
//  Created by Rafael Agayev on 12.01.26.
//

import SwiftUI

struct RecentSearchesSection: View {
    
    @Binding var searchText: String
    
    var body: some View {
        TextField("Search", text: $searchText)
            .padding()
            .roundedRectangleStyle(cornerRadius: 12, backgroundColor: .colorGray, borderColor: .colorBlack.opacity(0.55), borderWidth: 1.5)
//            .overlay(alignment: .trailing) {
//                if !searchText.isEmpty{
//                    Button{
//                        searchText = ""
//                    }label: {
//                        Image(systemName: "xmark.circle.fill")
//                            .foregroundStyle(.colorGray)
//                    }
//                    .padding(.trailing, 8)
//                }
//            }
    }
}
