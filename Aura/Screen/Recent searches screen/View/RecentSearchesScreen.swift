//
//  RecentSearchesScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 06.01.26.
//

import SwiftUI

struct RecentSearchesScreen: View {
    
    @StateObject private var vm = RecentSearchesViewModel()
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        ScrollView{
            
            RecentSearchesSection(searchText: $vm.searchText)
               
            FilteredNamesSection(model: $vm.model, searchText: $vm.searchText)
            
        }
        .scrollDismissesKeyboard(.interactively)
        .padding()
        .navigationBarBackButtonHidden()
        .toolbar {
            toolbar
        }
        .onAppear{
            vm.recentVIP()
        }
    }
}

extension RecentSearchesScreen{
    
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
        
        ToolbarItem(placement: .principal) {
            Text("Recent searches")
                .fontModifier(size: 15, weight: .semibold, foregroundColor: .primary)
        }
    }
}
