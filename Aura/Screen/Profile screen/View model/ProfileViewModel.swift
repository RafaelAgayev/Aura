//
//  ProfileViewModel.swift
//  Aura
//
//  Created by Rafael Agayev on 02.01.26.
//

import Foundation
import SwiftUI
internal import Combine
import CoreData


class ProfileViewModel: BaseViewModel {

    private let historyVM: HistoryViewModel

    init(historyVM: HistoryViewModel) {
        self.historyVM = historyVM
        super.init()
    }

    func profileChanged(
        section: String,
        description: String
    ) async {

        try? await withLoading {

            try await Task.sleep(nanoseconds: 600_000_000)

            historyVM.add(
                type: "Profile",
                title: section,
                subtitle: description
            )
        }
    }
}

