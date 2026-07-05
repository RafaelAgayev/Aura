//
//  WatchHistoryViewModel.swift
//  Aura
//
//  Created by Rafael Agayev on 15.04.26.
//

import Foundation
import SwiftUI

@Observable
class WatchHistoryViewModel: BaseViewModel {
    
    var sort: SortType = .newest
    
    var dateFilter: DateFilter = .all
    
    
    var startDate: Date? {
        if case let .custom(start, _) = dateFilter {
            return start
        }
        return nil
    }
    
    var showRange = false
    
    var endDate: Date? {
        if case let .custom(_, end) = dateFilter {
            return end
        }
        return nil
    }
    
    var dateTitle: String {
        switch dateFilter {
        case .all:
            return "All dates"
        case .pastWeek:
            return "Past week"
        case .pastMonth:
            return "Past month"
        case let .custom(start, end):
            guard let start, let end else { return "Select dates" }
            return "\(format(start)) - \(format(end))"
        }
    }
    
    var isValidRange: Bool {
        guard case let .custom(start, end) = dateFilter,
              let start, let end else { return false }
        return start <= end
    }
        
    func setStartDate(_ date: Date) {
        let currentEnd = endDate
        dateFilter = .custom(start: date, end: currentEnd)
    }
    
    func setEndDate(_ date: Date) {
        let currentStart = startDate
        dateFilter = .custom(start: currentStart, end: date)
    }
        
    private func format(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
    
    enum SortType {
        case newest, oldest
    }
    
    enum DateFilter: Equatable {
        case all
        case pastWeek
        case pastMonth
        case custom(start: Date?, end: Date?)
    }
}
