//
//  DeleteScreenViewModel.swift
//  Aura
//
//  Created by Rafael Agayev on 09.01.26.
//

import Foundation
import SwiftUI
internal import Combine

class DeleteScreenViewModel: BaseViewModel{
    
    @Published var title: String = "No Recently Deleted \nContent"
    
    @Published var subtitle: String = "When you delete posts, stories AuraTV videos \nand reels, they'll show up there. Only you can \nsee them"
}
