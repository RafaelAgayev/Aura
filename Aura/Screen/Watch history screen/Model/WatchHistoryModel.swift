//
//  WatchHistoryModel.swift
//  Aura
//
//  Created by Rafael Agayev on 15.04.26.
//

import Foundation

struct WatchHistoryModel: Identifiable{
    let id = UUID()
    let title: String
    let thumbnailURL: String
    let watchedDate: Date
}
