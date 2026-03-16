//
//  FilteredNamesSection.swift
//  Aura
//
//  Created by Rafael Agayev on 12.01.26.
//

import SwiftUI

struct FilteredNamesSection: View {

    @Binding var model: [RecentSearchesModel]
    
    @Binding var searchText: String
    
    enum Layout{
       
        
        static let imageWidth: CGFloat = 25
        
        static let imageHeight: CGFloat = 31
    }

    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 5) {
               
                ForEach(model, id: \.id) { item in
                    HStack(spacing: 13){
                        Image(item.image)
                        .resizable()
                        .scaledToFit()
                        .roundedCorners(cornerRadius: 6)
                        .frame(width: Layout.imageWidth, height: Layout.imageHeight)
                        
                       
                        VStack(alignment: .leading, spacing: 5){
                            Text(item.name)
                                .fontModifier(size: 16, weight: .semibold, foregroundColor: .colorBlack)
                            
                            Text(item.years)
                                .fontModifier(size: 12, weight: .medium, foregroundColor: .colorGray)
                        }
                        
                        Spacer()
                        
                        if item.id == UUID(uuidString: "00000000-0000-0000-0000-000000000004") ?? UUID() {
                            
                            Text(item.founder)
                                .fontModifier(size: 6, weight: .semibold, foregroundColor: .colorBlack)
                        }else {
                            Text(item.founder)
                                .fontModifier(size: 12, weight: .semibold, foregroundColor: .colorBlack)
                        }
                    }
                }
            }

            if model.isEmpty {
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

