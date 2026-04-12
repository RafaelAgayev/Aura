//
//  AboutSection.swift
//  Aura
//
//  Created by Rafael Agayev on 23.12.25.
//

import SwiftUI

struct AboutSection: View {
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Spacer()
            
            Text("Version: 1.2.4")
            
            if let url = URL(string: "https://www.google.com"){
                Link("Terms and Conditions", destination: url)
                    .foregroundStyle(.primary)
            }
            
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
