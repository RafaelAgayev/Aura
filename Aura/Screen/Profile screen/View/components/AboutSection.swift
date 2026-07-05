//
//  AboutSection.swift
//  Aura
//
//  Created by Rafael Agayev on 23.12.25.
//

import SwiftUI

struct AboutSection: View {
    
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Spacer()
            
            Text("Version: 1.2.4")
            
            if let url = URL(string: "https://www.google.com"){
                Link("Terms and Conditions", destination: url)
                    .foregroundStyle(colorScheme == .dark ? .colorWhite : .colorBlack)
            }
            
            Button{
                if let url = URL(string: "https://www.linkedin.com/in/rafaelagayev"){
                    UIApplication.shared.open(url)
                }
            }label:{
                Text("Support")
            }
            .foregroundStyle(colorScheme == .dark ? .colorWhite : .colorBlack)
        }
        .padding()
    }
}

#Preview {
    AboutSection()
}
