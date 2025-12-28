//
//  HistoryScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 23.12.25.
//

import SwiftUI
import CoreData

struct HistoryScreen: View {
  
    
    @Environment(\.managedObjectContext) private var context
    
    @StateObject private var vm: HistoryViewModel
    
    @Environment(\.dismiss) private var dismiss

    init(historyVM: HistoryViewModel) {
        _vm = StateObject(wrappedValue: historyVM)
    }
    
    var body: some View {
        List{
            ForEach(vm.items, id: \.objectID){ items in
                HistoryRow(item: items)
            }
            .onDelete { indexSet in
                for index in indexSet {
                    let item = vm.items[index]
                    vm.delete(item)
                }
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            toolbar
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
