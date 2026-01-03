//
//  BaseViewModel.swift
//  Aura
//
//  Created by Rafael Agayev on 03.01.26.
//

import SwiftUI
internal import Combine

class BaseViewModel: ObservableObject{
    
    @Published var isLoading = false
    
    @MainActor
       func withLoading<T>(_ action: () async throws -> T) async rethrows -> T {
           isLoading = true

           defer {
               Task { @MainActor in
                   try? await Task.sleep(nanoseconds: 1_000_000_000)
                   isLoading = false
               }
           }

           return try await action()
       }
}
