//
//  HealthStat.swift
//  Aura
//
//  Created by Rafael Agayev on 25.12.25.
//

import Foundation
import SwiftUI

struct HealthStat: Identifiable, Equatable{
    let id = UUID()
    let title: LocalizedStringKey
    let value: LocalizedStringKey
    let emoji: String
    let detail: LocalizedStringKey
}
