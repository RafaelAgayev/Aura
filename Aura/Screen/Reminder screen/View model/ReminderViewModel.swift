//
//  ReminderViewModel.swift
//  Aura
//
//  Created by Rafael Agayev on 02.01.26.
//

import Foundation
import SwiftUI
internal import Combine

class ReminderViewModel: ObservableObject{
    
    @Published var isEnabled: Bool = false
    
    @Published var reminderTime: Date = .now
    
    @Published var repeatDaily: Bool = true
    
    func save(){
        
        print("Observable object is saved", isEnabled)
    }
}
