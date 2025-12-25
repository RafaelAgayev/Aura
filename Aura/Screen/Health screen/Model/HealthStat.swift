//
//  HealthStat.swift
//  Aura
//
//  Created by Rafael Agayev on 25.12.25.
//

import Foundation

struct HealthStat: Identifiable, Equatable{
    let id = UUID()
    let title: String
    let value: String
    let emoji: String
    let detail: String
}
