//
//  ActionsHeader.swift
//  Aura
//
//  Created by Rafael Agayev on 04.01.26.
//

import SwiftUI

struct ActionsHeader: View {
    
    var body: some View {

        VStack(alignment: .center, spacing: 10) {

            Text("One place to manage\nyour activity")
                .fontModifier(size: 22, weight: .bold, foregroundColor: .primary)
                .multilineTextAlignment(.center)

            (
                Text("     View and manage your interactions, content\nand account activity. ")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundStyle(.colorGray)
                
                +
                Text("Learn more")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundStyle(.colorBlue)
            )
            .multilineTextAlignment(.center)
            .lineLimit(2)
            .onTapGesture {
                
            }
        }
    }
}


#Preview {
    ActionsHeader()
}
