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
                    BooksScreenSection(books: book)
                        .onTapGesture {
                            vm.selectedBook = book
                        }
                }
            .navigationDestination(item: $vm.selectedBook) { book in
                BookDetailsScreen(books: book)
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
    }
}

#Preview {
    BooksScreen()
}
