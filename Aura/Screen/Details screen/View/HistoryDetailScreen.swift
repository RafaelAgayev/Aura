//
//  DetailsScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 03.01.26.
//

import SwiftUI

struct HistoryDetailScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Environment(\.showLoading) private var showLoading
    
    @Environment(\.hideLoading) private var hideLoading
    
    @StateObject private var vm = HistoryDetailsViewModel()
    
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
        VStack(alignment: .leading, spacing: 0){
            HistoryDetailsScreenSection(
                title: item.title,
                subtitle: item.subtitle,
                date: item.date)
        }
        .padding(.vertical, 8)
        
        .frame(maxWidth: .infinity)
        
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemGray5))
        )
        .padding(.horizontal, 12)
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
                vm.showDelete = true
            }label: {
                Image(systemName: "trash")
                    .fontModifier(size: 15, weight: .medium, foregroundColor: .red)
            }
        }
    }
}


