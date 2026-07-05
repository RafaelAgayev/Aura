//
//  HistoryScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 23.12.25.
//

import SwiftUI
import CoreData

struct HistoryScreen: View {
  
    @ObservedObject var vm: HistoryViewModel
    
    @Environment(\.dismiss) private var dismiss
    
    @Environment(\.showLoading) private var showLoading
    
    @Environment(\.hideLoading) private var hideLoading
    
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        List{
            ForEach(vm.items, id: \.objectID){ items in
                
                NavigationLink{
                    HistoryDetailScreen(
                        onDelete: { vm.delete(items)
                        }, item: items)
                
                }label:{
                    HistoryRow(item: items)
                }
                   
            }
            
            .onDelete { indexSet in
                for index in indexSet {
                    let item = vm.items[index]
                   
                        vm.delete(item)
                }
            }
        }
        .task{
           await vm.fetch()
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            toolbar
        }
        .onChange(of: vm.isLoading) { _, isLoading in
            if isLoading{
                showLoading()
            }else {
                hideLoading()
            }
        }
        
    }
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent{
        ToolbarItem(placement: .navigationBarLeading) {
            Button{
                dismiss()
            }label: {
                Image(systemName: "chevron.left")
            }
        }
        
        ToolbarItem(placement: .principal) {
            Text("History")
                .fontModifier(size: 24, weight: .bold, foregroundColor: colorScheme == .dark ? .colorWhite : .colorBlack)
        }
    }
}

//#Preview {
//    HistoryScreen(context: NSManagedObjectContext)
//}
