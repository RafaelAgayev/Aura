//
//  InteractionsSection.swift
//  Aura
//
//  Created by Rafael Agayev on 05.01.26.
//

import SwiftUI

struct InteractionsSection: View {
    
    let onSelect: (NavigateLink) -> Void
    
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        
            
            List{
                
                Section("Interactions"){
                    ActionsViewer(title: "Likes", image: .icon("heart"))
                        .onTapGesture {
                            onSelect(.likes)
                        }
                    
                    ActionsViewer(title: "Comments", image: .icon("message"))
                        .onTapGesture {
                            onSelect(.comments)
                        }
                    
                    ActionsViewer(title: "Reposts", image: .icon("repeat"))
                        .onTapGesture {
                            onSelect(.reposts)
                        }
                    
                    ActionsViewer(title: "Tags", image: .icon("person.text.rectangle"))
                        .onTapGesture {
                            onSelect(.tags)
                        }
                    
                    ActionsViewer(title: "Sticker response", image: .icon("face.smiling"))
                        .onTapGesture {
                            onSelect(.stickerResponse)
                        }
                    
                    ActionsViewer(title: "Reviews", image: .icon("tag"))
                        .onTapGesture {
                            onSelect(.reviews)
                        }
                    
                    ActionsViewer(title: "Orders and payments", image: colorScheme == .dark ? .image(.iconCreditCardBlack) : .image(.iconCreditCard))
                        .onTapGesture {
                            onSelect(.orders)
                        }
                }
                
                .listRowSeparator(.hidden)
                .listSectionSeparator(.hidden)

                Rectangle()
                    .fill(Color.colorGray.opacity(0.25))
                    .frame(width: 400, height: 8)
                    .listSectionSeparator(.hidden)
                
                Section("Removed and archived content"){
                    
                    ActionsViewer(title: "Recently deleted", image: .icon("trash"))
                        .onTapGesture {
                            onSelect(.delete)
                        }
                    
                    
                    ActionsViewer(title: "Archived", image: .icon("clock.arrow.trianglehead.counterclockwise.rotate.90"))
                        .onTapGesture {
                            onSelect(.archived)
                        }
                }
                .listRowSeparator(.hidden)
                .listSectionSeparator(.hidden)

                Rectangle()
                    .fill(Color.colorGray.opacity(0.25))
                    .frame(width: 400, height: 8)
                    .listSectionSeparator(.hidden)
                
                Section("Content you shared"){
                    ActionsViewer(title: "Posts", image: .icon("square.grid.3x3.square"))
                        .onTapGesture {
                            onSelect(.posts)
                        }
                    
                    ActionsViewer(title: "Reels", image: .icon("play.square.stack.fill"))
                        .onTapGesture {
                            onSelect(.reels)
                        }
                    
                    ActionsViewer( title: "Highlights", image: .icon("bolt.heart"))
                        .onTapGesture {
                            onSelect(.highlights)
                        }
                }
                
                .listRowSeparator(.hidden)
                .listSectionSeparator(.hidden)

                Rectangle()
                    .fill(Color.colorGray.opacity(0.25))
                    .frame(width: 400, height: 8)
                    .listSectionSeparator(.hidden)
                
                Section("Suggested content") {
                    ActionsViewer(title: "Not interested", image: .icon("eye.slash"))
                        .onTapGesture {
                            onSelect(.notInterested)
                        }
                    
                    ActionsViewer(title: "Interested", image: .icon("eye"))
                        .onTapGesture {
                            onSelect(.interested)
                        }
                    ActionsViewer(title: "Creator subscriptions", image: .icon("crown"))
                        .onTapGesture {
                            onSelect(.creator)
                        }
                }
                
                .listRowSeparator(.hidden)
                .listSectionSeparator(.hidden)

                Rectangle()
                    .fill(Color.colorGray.opacity(0.25))
                    .frame(width: 400, height: 8)
                    .listSectionSeparator(.hidden)
                
                Section("How to use Aura") {
                    
                    ActionsViewer(title: "Time spent", image: .icon("clock"))
                        .onTapGesture {
                            onSelect(.timeSpent)
                        }
                    
                    ActionsViewer(title: "Watch history", image: .icon("photo.badge.arrow.down.fill"))
                        .onTapGesture {
                            onSelect(.watchHistory)
                        }
                    
                    ActionsViewer(title: "Account history", image: .icon("calendar"))
                        .onTapGesture {
                            onSelect(.accountHistory)
                        }
                    
                    ActionsViewer(title: "Recent searches", image: .icon("magnifyingglass"))
                        .onTapGesture {
                            onSelect(.recentSearches)
                        }
                    
                    ActionsViewer(title: "Link History", image: .icon("link"))
                        .onTapGesture {
                            onSelect(.linkHistory)
                        }
                }
                .listRowSeparator(.hidden)
                .listSectionSeparator(.hidden)

                Rectangle()
                    .fill(Color.colorGray.opacity(0.25))
                    .frame(width: 400, height: 8)
                    
                    .listSectionSeparator(.hidden)
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .background(Color(.systemBackground))
            
          
            
    }
}

extension InteractionsSection{
   
    
    enum NavigateLink: Hashable {
        case likes, comments, reposts, tags, stickerResponse, reviews, delete, archived, posts, reels, highlights, notInterested, interested, timeSpent, watchHistory, accountHistory, recentSearches, linkHistory, creator, orders
    }
}

