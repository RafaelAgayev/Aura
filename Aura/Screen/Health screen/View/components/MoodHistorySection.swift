//
//  MoodHistorySection.swift
//  Aura
//
//  Created by Rafael Agayev on 25.12.25.
//

import SwiftUI

struct MoodHistorySection: View {
    
    @State private var selectedMood: String = ""
    
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
                        selectedMood = mood.description
                    }label: {
                        Text(mood.emoji)
                            .font(.largeTitle)
                            .padding(8)
                            .background(selectedMood == mood.description ? Color.blue.opacity(0.3) : Color.clear)
                            .clipShape(Circle())
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
        .padding()
        
    }
}

#Preview {
    MoodHistorySection()
}
