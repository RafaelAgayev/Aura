//
//  ReviewsScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 06.01.26.
//

import SwiftUI

struct ReviewsScreen: View {
    
    @StateObject private var vm: ReviewsViewModel = .init()
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .center, spacing: 12){
                Image(.hand)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                
                Text(vm.title)
                    .fontModifier(size: 25, weight: .semibold, foregroundColor: .primary)
                
                Text(vm.subtitle)
                    .fontModifier(size: 18, weight: .medium, foregroundColor: .colorGray)
            }
        }
        .padding(.vertical, 20)
        .navigationBarBackButtonHidden()
        .toolbar {
            toolbar
        }
    }
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent{
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
    ReviewsScreen()
}
