//
//  InterestedViewModel.swift
//  Aura
//
//  Created by Rafael Agayev on 13.01.26.
//

import Foundation
import SwiftUI
internal import Combine

class InterestedViewModel: BaseViewModel{
    
    
    @Published var hasData: Bool = false
    
    @Published var errorMessage: String? = nil
    
    @Published var items: [InterestedItemModel] = []
    
    func loadData(){
        
        isLoading = true
        hasData = false
        errorMessage = nil
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                   self.items = [
                    InterestedItemModel(title: "Music", description: "Relaxing tracks for evening", systemImage: "music.note", type: .music),
                    InterestedItemModel(title: "Books", description: "Top recommendations for self-growth", systemImage: "book.fill", type: .books),
                    InterestedItemModel(title: "Travel", description: "Destinations to explore this year", systemImage: "airplane", type: .travel),
                   ]
                   
                   self.hasData = !self.items.isEmpty
                   self.isLoading = false
               }
    }
    
}
