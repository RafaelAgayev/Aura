//
//  FilteredNamesSection.swift
//  Aura
//
//  Created by Rafael Agayev on 12.01.26.
//

import SwiftUI

struct FilteredNamesSection: View {

    @Binding var filteredNames: [String]
    
    @Binding var searchText: String

    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 0) {
               
                ForEach(filteredNames, id: \.self) { name in
                    Text(name)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 12)
                        .onTapGesture {
                            searchText = name
                        }
                    
                    Divider()
                }
            }

            if filteredNames.isEmpty {
                VStack(spacing: 12) {
                    Image(systemName: "person.fill")
                        .fontModifier(
                            size: 40,
                            weight: .bold,
                            foregroundColor: .colorBlack
                        )

                    Text("No result")
                        .fontModifier(
                            size: 25,
                            weight: .semibold,
                            foregroundColor: .colorGray
                        )
                }
                .padding(.vertical, 12)
                .padding(.horizontal, 6)
            }
        }
    }
}

