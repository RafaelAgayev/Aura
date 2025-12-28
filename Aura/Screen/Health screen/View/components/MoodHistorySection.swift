//
//  MoodHistorySection.swift
//  Aura
//
//  Created by Rafael Agayev on 25.12.25.
//

import SwiftUI

struct MoodHistorySection: View {
    
    @State private var selectedMood: String = ""
    
    let healthVM: HealthScreenViewModel
    
    let moods: [(emoji: String, description: String)] = [
        ("😄", "Happy"),
        ("🙂‍↔️", "Content"),
        ("😔", "Sad"),
        ("🤒", "Sick"),
        ("🥳", "Get party"),
        ("🤑", "Rich")
    ]
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 12){
            Text("Mood History")
                .font(.headline)
            
            HStack(spacing: 12){
                ForEach(moods, id: \.description){ mood in
                    Button{
                        withAnimation(.spring){
                            selectedMood = mood.description
                        }
                    }label: {
                        Text(mood.emoji)
                            .font(.largeTitle)
                            .padding(8)
                            .background(selectedMood == mood.description ? Color.blue.opacity(0.3) : Color.clear)
                            .clipShape(Circle())
                            .rotationEffect(.degrees(healthVM.isAnimate ? 10 : -10))
                            .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: healthVM.isAnimate)
                            .onAppear {
                                healthVM.isAnimate = true
                            }
                    }
                    .buttonStyle(.plain)
                }
              
            }
            if !selectedMood.isEmpty{
                Text("\(selectedMood)")
                    .font(.headline)
                    .foregroundStyle(.secondary)
                    .padding(.horizontal, 12)
            }
        }
        .transition(.move(edge: .bottom))
        .padding()
        
    }
}

//#Preview {
//    MoodHistorySection()
//}
