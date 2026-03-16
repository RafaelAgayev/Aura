//
//  LogoutSettings.swift
//  Aura
//
//  Created by Rafael Agayev on 16.03.26.
//

import SwiftUI

struct LogoutSettings: View{
    
    @Binding var showDialog: Bool
    
    var onLogout: () async  -> Void
     
    var body: some View{
        VStack(alignment: .center, spacing: 10){
            
            Text("Logout")
                .fontModifier(size: 22, weight: .bold, foregroundColor: .colorBlack)
            
            Text("Do you want logout ? If you logout and delete your token.")
                .fontModifier(size: 14, weight: .medium, foregroundColor: .colorBlack)
            
            HStack(spacing: 16) {
                
                Text("Cancel")
                    .fontModifier(size: 12, weight: .bold, foregroundColor: .colorBlack)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .roundedRectangleStyle(cornerRadius: 12, backgroundColor: .colorGray.opacity(0.15), borderColor: .clear, borderWidth: 1)
                    .onTapGesture {
                        withAnimation{
                            showDialog = false
                        }
                    }
                
                HStack(spacing: 8) {
                    Image(systemName: "arrow.turn.up.left")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 14, height: 14)
                        .foregroundStyle(.colorWhite)
                    
                    Text("Logout")
                        .fontModifier(size: 14, weight: .bold, foregroundColor: .colorWhite)
                }
                .onTapGesture {
                    Task{
                      await onLogout()
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .roundedRectangleStyle(cornerRadius: 12, backgroundColor: .red.opacity(0.82), borderColor: .clear, borderWidth: 1)
            }
            .padding(.horizontal, 16)
        }
        .padding(20)
        .background(.colorWhite)
        .roundedCorners(cornerRadius: 20)
        .shadow(radius: 10)
        .padding()
        .frame(minWidth: 361)
        .transition(.scale)
        .zIndex(1)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
