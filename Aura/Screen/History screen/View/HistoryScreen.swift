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

    var body: some View {
        List{
            ForEach(vm.items, id: \.objectID){ items in
                
                NavigationLink{
                    DetailsScreen(
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
        .onAppear{
            vm.fetch()
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
    }
}

//#Preview {
//    HistoryScreen(context: NSManagedObjectContext)
//}
