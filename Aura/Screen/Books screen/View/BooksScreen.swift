//
//  BooksScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 15.01.26.
//

import SwiftUI

struct BooksScreen: View {

    @StateObject private var vm = BooksViewModel()
    
    @Environment(\.dismiss) private var dismiss

    var body: some View {
       
            ScrollView {
                
                ForEach(vm.books, id: \.id) { book in
                    NavigationLink{
                        DetailableScreen(content: .book(book))
                    }label: {
                        BooksScreenSection(books: book)
                    }
                    Divider()
                }
           
            .navigationBarBackButtonHidden()
            .toolbar {
                toolbar
            }
            .onAppear {
                vm.loadBooks()
            }
        }
    }
}

extension BooksScreen{
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
            Text("Books")
                .fontModifier(size: 20, weight: .semibold, foregroundColor: .colorBlack)
        }
    }
}

#Preview {
    BooksScreen()
}
