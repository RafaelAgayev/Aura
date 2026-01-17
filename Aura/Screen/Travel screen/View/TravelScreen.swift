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
                TravelScreenSection(travel: travel)
                    .onTapGesture {
                        vm.selectedModel = travel
                    }
            }
        }
        .onAppear{
            vm.loadTravel()
        }
        .navigationDestination(item: $vm.selectedModel){ travel in
            TravelDetailsScreen(travel: travel)
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
    }
}

#Preview {
    TravelScreen()
}
