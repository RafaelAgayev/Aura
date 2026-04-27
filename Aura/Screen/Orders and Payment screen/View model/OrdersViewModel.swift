//
//  OrdersViewModel.swift
//  Aura
//
//  Created by Rafael Agayev on 26.04.26.
//

import Foundation
import SwiftUI

class OrdersViewModel: BaseViewModel{
    
    var text: String = ""
    
    var image: ImageResource?
    
    enum Navigation{
        case subscriptions, autoDetection, security, help
        
        var nav: String{
            switch self {
            case .subscriptions:
                return "Subscriptions"
            case .autoDetection:
                return "AutoDetection"
            case .security:
                return "Security"
            case .help:
                return "Help & support"
            }
        }
    }
}
