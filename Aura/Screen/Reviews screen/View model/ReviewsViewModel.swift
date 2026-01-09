//
//  ReviewsViewModel.swift
//  Aura
//
//  Created by Rafael Agayev on 09.01.26.
//

import Foundation
import SwiftUI
internal import Combine

class ReviewsViewModel: BaseViewModel{
    
    @Published var title: String = "No review activity"
    
    @Published var subtitle: String = "When you submit reviews on Aura they will\n appear here."
}
