//
//  TravelDetailsScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 17.01.26.
//

import SwiftUI

struct TravelDetailsScreen: View {
    
    let travel: TravelModel?
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView{
            TravelDetailsSection(travel: travel ?? .init(id: UUID(uuidString: "llld" ) ?? UUID(), title: "mdnmmns", description: "dsmnsmnd", image: .coastHotel, rank: 1122, liked: 4.23, location: "Baku"))
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            toolbar
        }
    }
}

extension TravelDetailsScreen{
    @ToolbarContentBuilder
    var toolbar: some ToolbarContent{
        ToolbarItem(placement: .topBarLeading) {
            Button{
                dismiss()
            }label: {
                Image(systemName: "chevron.left")
                    .foregroundStyle(.primary)
            }
        }
    }
}
