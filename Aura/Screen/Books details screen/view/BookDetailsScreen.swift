//
//  BookDetailsScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 15.01.26.
//

import SwiftUI

struct BookDetailsScreen: View {
    
    let books: BooksModel?
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        ScrollView{
            BooksDetailsSection(
                books: books ?? .init(id: UUID(uuidString: "llklk") ?? UUID(),
                                      title: "opoi",
                                      author: "pooo",
                                      description: "mnnmmn",
                                      image: .lesMiserables,
                                      year: "2026"
                                     )
            )
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            toolbar
        }
    }
}

extension BookDetailsScreen{
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

