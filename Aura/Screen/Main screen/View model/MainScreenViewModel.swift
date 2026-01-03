//
//  MainScreenViewModel.swift
//  Aura
//
//  Created by Rafael Agayev on 02.01.26.
//

import Foundation
import SwiftUI
internal import Combine

class MainScreenViewModel: ObservableObject {
   
    @AppStorage("language") private var language = "az"
}
