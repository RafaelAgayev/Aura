//
//  PrimaryActionModifier.swift
//  Aura
//
//  Created by Rafael Agayev on 22.12.25.
//

import SwiftUI

struct PrimaryActionModifier: ViewModifier {
    
    @Environment(\.isEnabled) private var enabled
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.white)
            .background{
                Color.colorAccent
                    .opacity(enabled ? 1 : 0.5)
            }
            .roundedCorners(cornerRadius: 10, rect: .allCorners)
    }
    
}

extension View {
    
    func primaryActionModifier() -> some View {
        modifier(PrimaryActionModifier())
    }
    
}
