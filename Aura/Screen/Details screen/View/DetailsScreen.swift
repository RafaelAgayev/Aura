//
//  DetailsScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 03.01.26.
//

import SwiftUI

struct DetailsScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Environment(\.showLoading) private var showLoading
    
    @Environment(\.hideLoading) private var hideLoading
    
    
    @State private var showDelete = false
    
    var onDelete: () -> Void
    
    let item: HistoryEntity
    
    var body: some View {
        ScrollView{
            content
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            toolbar
        }
        .alert("Delete history?", isPresented: $showDelete) {
            Button("Delete", role: .destructive){
                onDelete()
                dismiss()
            }
            Button("Cancel", role: .cancel){}
            
        }message: {
            Text("This action is undone")
        }
    }
    
    private var content: some View{
        VStack(alignment: .leading, spacing: 12){
            DetailsScreenSection(
                title: item.title,
                subtitle: item.subtitle,
                date: item.date)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemGray5))
        )
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
        
        ToolbarItem(placement: .topBarTrailing) {
            Button(role: .destructive){
               showDelete = true
            }label: {
                Image(systemName: "trash")
                    .fontModifier(size: 15, weight: .medium, foregroundColor: .red)
            }
        }
    }
}


