//
//  ProfileViewModel.swift
//  Aura
//
//  Created by Rafael Agayev on 02.01.26.
//

import Foundation
import SwiftUI
internal import Combine
import CoreData

class ProfileViewModel: ObservableObject{
    
    private let historyVM: HistoryViewModel?
    
    init(historyVM: HistoryViewModel? = nil) {
        self.historyVM = historyVM
    }
    
    func save(){
        
    }
}
