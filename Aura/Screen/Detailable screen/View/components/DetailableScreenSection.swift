//
//  DetailableScreenSection.swift
//  Aura
//
//  Created by Rafael Agayev on 20.01.26.
//

import SwiftUI

struct DetailableScreenSection: View {
    let content: ContentType
    
    @State private var showFullScreen = false
    
    @Binding var fullScreenContent: FullScreenComponents?
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 10){
                switch content {
                case .book(let books):
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
                                        .onTapGesture {
                                            fullScreenContent = .book(img)
                                        }
                                    
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
                case .travel(let travel):
                    VStack(alignment: .center, spacing: 12){
                        if let img = travel.image{
                            Image(img)
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth: .infinity)
                                .frame(width: 400)
                            
                                .roundedCorners(cornerRadius: 12)
                                .onTapGesture(count: 2){
                                    fullScreenContent = .travel(img)
                                }
                            
                        }
                        VStack(alignment: .leading, spacing: 8){
                            HStack(alignment: .center, spacing: 5){
                                Text(travel.title)
                                    .fontModifier(size: 12, weight: .semibold, foregroundColor: .colorBlack)
                                    .lineLimit(1)
                                
                                Text("Rank: ⭐️ \( travel.rank)")
                                    .fontModifier(size: 12, weight: .semibold, foregroundColor: .colorBlack)
                                
                                Text("Like this: ❤️‍🔥 \(travel.liked, default: "%1.f")")
                                    .fontModifier(size: 12, weight: .semibold, foregroundColor: .colorBlack)
                            }
                            Text("Description: \(travel.description)")
                                .fontModifier(size: 10, weight: .semibold, foregroundColor: .colorGray)
                            
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 6)
                    }
                    
                case .music(let music):
                    VStack(alignment: .leading, spacing: 12){
                        if let img = music.image{
                            Image(img)
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: .infinity)
                                .frame(height: 400)
                                .roundedCorners(cornerRadius: 16)
                                .onTapGesture {
                                    fullScreenContent = .music(img)
                                }
                            
                        }
                        
                        HStack(alignment: .center, spacing: 5){
                            Text(music.artist)
                                .fontModifier(size: 20, weight: .bold, foregroundColor: .colorBlack)
                            
                            Text("- \(music.songName)")
                                .fontModifier(size: 16, weight: .semibold, foregroundColor: .colorBlack)
                        }
                       
                        
                        Text("About: \(music.description)")
                            .fontModifier(size: 16, weight: .semibold, foregroundColor: .colorGray)
                       
                    }
                    .padding()
                }
            }
            
        }
    }
}


