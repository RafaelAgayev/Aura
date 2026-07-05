//
//  InterestedScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 06.01.26.
//

import SwiftUI

struct InterestedScreen: View {
    
    @StateObject private var vm = InterestedViewModel()
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var selectedItem: Item?
    
    var body: some View {
        InterestedScreenSection(
            isLoading: $vm.isLoading,
            errorMessage: $vm.errorMessage,
            hasData: $vm.hasData,
            items: $vm.items,
            loadData: { vm.loadData()},
            onItemTap: { item in
                selectedItem = item
                
            }
        )
        .navigationBarBackButtonHidden()
        .toolbar {
            toolbar
        }
        .navigationDestination(item: $selectedItem){ item in
            switch selectedItem {
            case .books:
                BooksScreen()
            case .travel:
                TravelScreen()
            case .music:
                MusicScreen()
            case nil:
                EmptyView()
            }
        
        }
        .onAppear{
            vm.loadData()
        }
    }
}

extension InterestedScreen{
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
            Text("Interested screen")
                .font(.headline)
        }
    }
    
    enum Item{
        case books, travel, music
    }
}

#Preview {
    InterestedScreen()
}
