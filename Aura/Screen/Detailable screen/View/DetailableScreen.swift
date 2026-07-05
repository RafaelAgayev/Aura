//
//  DetailableScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 20.01.26.
//

import SwiftUI

struct DetailableScreen: View {
    
    let content: ContentType
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var fullScreenContent: FullScreenComponents? = nil
    
    var body: some View {
        ScrollView{
            DetailableScreenSection(
                content: content,
                fullScreenContent: $fullScreenContent
            )
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            toolbar
        }
        .fullScreenCover(item: $fullScreenContent) { item in
            switch item{
            case .book(let img), .music(let img), .travel(let img):
                FullScreenImageView(image: img)
            }
        }
    }
}

extension DetailableScreen{
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
        ToolbarItem(placement: .principal) {
            Text("Details")
                .fontModifier(size: 20, weight: .semibold, foregroundColor: .colorBlack)
        }
    }
}
