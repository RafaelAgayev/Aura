//
//  BooksScreenSection.swift
//  Aura
//
//  Created by Rafael Agayev on 15.01.26.
//

import SwiftUI

struct BooksScreenSection: View {
    
    let books: BooksModel

    var body: some View {
        HStack(spacing: 8) {
            if let img = books.image{
                Image(img)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 100)
                    .roundedCorners(cornerRadius: 12)
                VStack(alignment: .leading, spacing: 8){
                    HStack{
                        Text(books.title)
                            .fontModifier(size: 18, weight: .semibold, foregroundColor: .colorBlack)
                        Text("- \(books.author)")
                            .fontModifier(size: 18, weight: .semibold, foregroundColor: .colorBlack)
                    }
                }
            }
        }
        .padding()
    }
}
