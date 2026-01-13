//
//  NotInterestedScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 06.01.26.
//

import SwiftUI

struct NotInterestedScreen: View {
    
    @State private var effect  = false
    
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        
        VStack(alignment: .center, spacing: 12) {
            Image(systemName: "person.crop.circle.badge.exclamationmark")
                
                .fontModifier(size: 42, weight: .bold, foregroundColor: .colorAccent)
                .rotationEffect(.degrees(effect ? 20 : -20))
            
            Text("Not found yet ")
                .fontModifier(size: 14, weight: .medium, foregroundColor: .primary)
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            toolbar
        }
    }
}

extension NotInterestedScreen{
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

#Preview {
    NotInterestedScreen()
}
