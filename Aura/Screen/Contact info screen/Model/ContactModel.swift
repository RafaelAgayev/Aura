//
//  ContactModel.swift
//  Aura
//
//  Created by Rafael Agayev on 10.05.26.
//

import Foundation
import SwiftUI

struct ContactModel: Identifiable{
    var id = UUID()
    var email: String
    var number: String
}
