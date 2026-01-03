//
//  HealthHeader.swift
//  Aura
//
//  Created by Rafael Agayev on 25.12.25.
//

import SwiftUI

struct HealthHeader: View {
    
    @Binding var showCamera: Bool
    
    let vm: HealthScreenViewModel
    
    @Environment(\.showLoading) private var showLoading
    
    @Environment(\.hideLoading) private var hideLoading

    
    var body: some View {
        VStack(alignment: .leading, spacing: 12){
            
            Text("AI Health Insight")
                .font(.headline)
                .fontWeight(.bold)
            
            Text("Scan your face and get insights about your mood and energy.")
                .font(.subheadline)
            
            Button{
                showCamera = true
            }label: {
                HStack{
                    Image(systemName: "camera.fill")
                        .foregroundStyle(.colorBlack)
                    Text("Scan now")
                        .foregroundStyle(.colorBlack)
                        .bold()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                   RoundedRectangle(cornerRadius: 12)
                    .fill(Color(.systemGray6))
                    .blur(radius: 2)
                       
                )
                .foregroundStyle(.colorWhite)
                .roundedCorners(cornerRadius: 14)
            }
            
        }
        .onChange(of: vm.isLoading){ oldValue, newValue in
            if newValue{
                showLoading()
            }else {
                hideLoading()
            }
        }
        .padding()
    }
}

//#Preview {
//    HealthHeader()
//}
