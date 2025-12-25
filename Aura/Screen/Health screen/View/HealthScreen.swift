//
//  HealthScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 23.12.25.
//

import SwiftUI

struct HealthScreen: View {
        
    @Environment(\.dismiss) private var dismiss
        
    @StateObject private var vm = HealthScreenViewModel()
    
    var body: some View {
        
        ScrollView{
            
            VStack(alignment: .leading, spacing: 24) {
                
                HealthHeader(showCamera: $vm.showCamera)
                
                TodayInsightCard(text: vm.todayInsight)
                
                HealthStatsCard()
                
                AISuggestionsSection()
                
                MoodHistorySection()
                
            }
        }

        .navigationDestination(isPresented: $vm.showCamera) {
            CameraPicker { image in
                vm.analyzeFace(image)
            }
            .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            toolbar
        }
    }
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent{
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
    HealthScreen()
}
