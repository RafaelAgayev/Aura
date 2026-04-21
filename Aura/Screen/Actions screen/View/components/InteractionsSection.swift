//
//  InteractionsSection.swift
//  Aura
//
//  Created by Rafael Agayev on 05.01.26.
//

import SwiftUI

struct InteractionsSection: View {
    
    let onSelect: (NavigateLink) -> Void
    
    var body: some View {
        
            
            List{
                
                Section("Interactions"){
                    ActionsViewer(icon: "heart", title: "Likes")
                        .onTapGesture {
                            onSelect(.likes)
                        }
                    
                    ActionsViewer(icon: "message", title: "Comments")
                        .onTapGesture {
                            onSelect(.comments)
                        }
                    
                    ActionsViewer(icon: "repeat", title: "Reposts")
                        .onTapGesture {
                            onSelect(.reposts)
                        }
                    
                    ActionsViewer(icon: "person.text.rectangle", title: "Tags")
                        .onTapGesture {
                            onSelect(.tags)
                        }
                    
                    ActionsViewer(icon: "face.smiling", title: "Sticker response")
                        .onTapGesture {
                            onSelect(.stickerResponse)
                        }
                    
                    ActionsViewer(icon: "tag", title: "Reviews")
                        .onTapGesture {
                            onSelect(.reviews)
                        }
                }
                
                .listRowSeparator(.hidden)
                .listSectionSeparator(.hidden)

                Rectangle()
                    .fill(Color.colorGray.opacity(0.25))
                    .frame(width: 400, height: 8)
                    .listSectionSeparator(.hidden)
                
                Section("Removed and archived content"){
                    
                    ActionsViewer(icon: "trash", title: "Recently deleted")
                        .onTapGesture {
                            onSelect(.delete)
                        }
                    
                    
                    ActionsViewer(icon: "clock.arrow.trianglehead.counterclockwise.rotate.90", title: "Archived")
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
                    ActionsViewer(icon: "square.grid.3x3.square", title: "Posts")
                        .onTapGesture {
                            onSelect(.posts)
                        }
                    
                    ActionsViewer(icon: "play.square.stack.fill", title: "Reels")
                        .onTapGesture {
                            onSelect(.reels)
                        }
                    
                    ActionsViewer(icon: "bolt.heart", title: "Highlights")
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
                    ActionsViewer(icon: "eye.slash", title: "Not interested")
                        .onTapGesture {
                            onSelect(.notInterested)
                        }
                    
                    ActionsViewer(icon: "eye", title: "Interested")
                        .onTapGesture {
                            onSelect(.interested)
                        }
                    ActionsViewer(icon: "crown", title: "Creator subscriptions")
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
                    
                    ActionsViewer(icon: "clock", title: "Time spent")
                        .onTapGesture {
                            onSelect(.timeSpent)
                        }
                    
                    ActionsViewer(icon: "photo.badge.arrow.down.fill", title: "Watch history")
                        .onTapGesture {
                            onSelect(.watchHistory)
                        }
                    
                    ActionsViewer(icon: "calendar", title: "Account history")
                        .onTapGesture {
                            onSelect(.accountHistory)
                        }
                    
                    ActionsViewer(icon: "magnifyingglass", title: "Recent searches")
                        .onTapGesture {
                            onSelect(.recentSearches)
                        }
                    
                    ActionsViewer(icon: "link", title: "Link History")
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
        case likes, comments, reposts, tags, stickerResponse, reviews, delete, archived, posts, reels, highlights, notInterested, interested, timeSpent, watchHistory, accountHistory, recentSearches, linkHistory, creator
    }
}

