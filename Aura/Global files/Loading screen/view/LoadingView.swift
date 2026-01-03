//
//  LoadingView.swift
//  Aura
//
//  Created by Rafael Agayev on 03.01.26.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        
        ZStack{
            Color.colorBlack.opacity(0.35)
                .ignoresSafeArea()
            
            VStack(spacing: 16){
                ProgressView()
                    .progressViewStyle(.circular)
                
                Text("Loading...")
                    .font(.footnote)
                    .foregroundStyle(.colorBlack)
            }
            .padding(24)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
            )
        }
        .transition(.opacity)
       
    }
}

#Preview {
    LoadingView()
}
