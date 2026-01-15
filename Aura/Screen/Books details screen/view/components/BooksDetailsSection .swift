//
//  BooksDetailsSection .swift
//  Aura
//
//  Created by Rafael Agayev on 15.01.26.
//

import SwiftUI

struct BooksDetailsSection: View {
    
    let books: BooksModel
    
    var body: some View {
        
        ScrollView{
            VStack(alignment: .leading, spacing: 10){
                VStack(alignment: .center){
                    if let img = books.image{
                        Image(img)
                            
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity)
                            .frame(height: 400)
                            .roundedCorners(cornerRadius: 14)
                            .padding()
                    }
                }
                
                Text("Author: \(books.author)")
                    .fontModifier(size: 22, weight: .semibold, foregroundColor: .colorBlack)
                
                Text("Title: \(books.title)")
                    .fontModifier(size: 20, weight: .semibold, foregroundColor: .colorBlack)
                
                Text("Year: \(books.year)")
                    .fontModifier(size: 18, weight: .medium, foregroundColor: .colorBlack)
                
                Text("Description: \(books.description)")
                    .fontModifier(size: 12, weight: .medium, foregroundColor: .colorGray)

            }
            .padding()
        }
        
    }
}
