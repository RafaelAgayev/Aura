//
//  ReviewsViewModel.swift
//  Aura
//
//  Created by Rafael Agayev on 09.01.26.
//

import Foundation
import SwiftUI
internal import Combine

@Observable
class ReviewsViewModel: BaseViewModel{
    
     var title: String = "No review activity"
    
     var subtitle: String = "When you submit reviews on Aura they will\n appear here."
}
