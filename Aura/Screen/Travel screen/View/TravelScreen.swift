//
//  TravelScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 15.01.26.
//

import SwiftUI

struct TravelScreen: View {
    
    @StateObject private var vm = TravelViewModel()
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView{
            
            ForEach(vm.model, id: \.id) { travel in
                NavigationLink{
                    DetailableScreen(content: .travel(travel))
                }label: {
                    TravelScreenSection(travel: travel)
                }
                Divider()
            }
        }
        .onAppear{
            vm.loadTravel()
        }
        
        .navigationBarBackButtonHidden()
        .toolbar{
            toolbar
        }
    }
}

extension TravelScreen{
    @ToolbarContentBuilder
    var toolbar: some ToolbarContent{
        ToolbarItem(placement: .topBarLeading) {
            Button{
                dismiss()
            }label: {
                Image(systemName: "chevron.left")
                    .foregroundStyle(.primary)
            }
        }
        
        ToolbarItem(placement: .principal) {
            Text("Hotels")
                .fontModifier(size: 20, weight: .semibold, foregroundColor: .colorBlack)
        }
    }
}

#Preview {
    TravelScreen()
}
