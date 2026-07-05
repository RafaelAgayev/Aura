//
//  LoadingExtension.swift
//  Aura
//
//  Created by Rafael Agayev on 03.01.26.
//

import SwiftUI

extension EnvironmentValues{
    
    @Entry var showLoading: () -> Void = { }
    
    @Entry var hideLoading: () -> Void = { }
}
