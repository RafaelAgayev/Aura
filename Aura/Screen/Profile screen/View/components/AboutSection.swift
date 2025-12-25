//
//  AboutSection.swift
//  Aura
//
//  Created by Rafael Agayev on 23.12.25.
//

import SwiftUI

struct AboutSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            Text("Version: 1.0.1")
            
            Link("Terms and Conditions", destination: URL(string: "https://www.google.com")!)
                .foregroundStyle(.primary)
            
            Button{
                if let url = URL(string: "https://www.linkedin.com/in/rafaelagayev"){
                    UIApplication.shared.open(url)
                }
            }label:{
                Text("Support")
            }
            .foregroundStyle(.primary)
        }
        .padding()
    }
}

#Preview {
    AboutSection()
}
