//
//  HistoryViewModel.swift
//  Aura
//
//  Created by Rafael Agayev on 27.12.25.
//

import Foundation
import SwiftUI
import CoreData
internal import Combine

class HistoryViewModel: ObservableObject{
    
    @Published var items: [HistoryEntity] = []
    
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext){
        self.context = context
        fetch()
    }
    
    func fetch() {
        let request: NSFetchRequest<HistoryEntity> = HistoryEntity.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
        
        do {
            items = try context.fetch(request)
        } catch {
            print("Fetch error:", error)
            items = []
        }
    }
    
    func add(
        type: String,
        title: String,
        subtitle: String
    ){
        let item = HistoryEntity(context: context)
        item.id = UUID()
        item.title = title
        item.type = type
        item.subtitle = subtitle
        item.date = Date()
        
        save()
    }
    
    func delete(_ item: HistoryEntity){
        context.delete(item)
        save()
    }
    
    private func save(){
        do{
            try context.save()
            fetch()
        }catch{
            print("Save error -->", error.localizedDescription)
        }

        
    }
}

