//
//  HealthStatsCard.swift
//  Aura
//
//  Created by Rafael Agayev on 25.12.25.
//

import SwiftUI

struct HealthStatsCard: View {
    
    @StateObject private var healthVM = HealthScreenViewModel()
    
    @State private var isSelected = false
    
    var body: some View {
        LazyVGrid(columns: [
            GridItem(.flexible()),
            GridItem(.flexible())
        ], spacing: 16){
            ForEach(healthVM.stats) { stat in
                HealthStatItem(stat: stat, isSelected: healthVM.selectedStat == stat )
                    .onTapGesture {
                        withAnimation(.spring){
                            healthVM.selectedStat = healthVM.selectedStat == stat ? nil : stat
                        }
                    }
            }
        }
        if let selectedStat = healthVM.selectedStat{
            VStack(alignment: .leading, spacing: 12) {
                Text(selectedStat.title)
                    .font(.headline)
                
                Text(selectedStat.detail)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(.systemGray6))
            )
            .transition(.move(edge: .bottom).combined(with: .opacity))
            
        }
    }
}

#Preview {
    HealthStatsCard()
}
