//
//  ActionsScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 04.01.26.
//

import SwiftUI

struct ActionsScreen: View {

    @Environment(\.dismiss) private var dismiss
    
    @State private var navigateInteraction: InteractionsSection.NavigateLink?
    
    var body: some View {

            ZStack {
                Color(.systemBackground)
                    .ignoresSafeArea()

                VStack {
                    ActionsHeader()
                    
                    InteractionsSection{ selected in
                        navigateInteraction = selected
                    }
                }
                .navigationDestination(item: $navigateInteraction.self) { destination in
                    switch destination{
                    case .likes:
                        LikesScreen()
                  
                    case .comments:
                        CommentsScreen()
                        
                    case .reposts:
                        RepostsScreen()
                        
                    case .stickerResponse:
                        StickerResponseScreen()
                        
                    case .reviews:
                        ReviewsScreen()
                        
                    case .tags:
                        TagsScreen()
                        
                    case .delete:
                        DeleteScreen()
                        
                    case .archived:
                        ArchivedScreen()
                        
                    case .posts:
                        PostsScreen()
                        
                    case .reels:
                        ReelsScreen()
                        
                    case .highlights:
                        HightlightsScreen()
                        
                    case .notInterested:
                        NotInterestedScreen()
                        
                    case .interested:
                        InterestedScreen()
                        
                    case .timeSpent:
                        TimeSpentScreen()
                        
                    case .watchHistory:
                        WatchHistoryScreen()
                        
                    case .accountHistory:
                        AccountHistoryScreen()
                        
                    case .recentSearches:
                        RecentSearchesScreen()
                        
                    case .linkHistory:
                        LinkHistoryScreen()
                        
                    }
                }
            }
            .navigationBarBackButtonHidden()
            .toolbar {
                toolbar
            }
            .toolbarBackground(Color(.systemBackground), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            
    }

    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .foregroundStyle(.primary)
            }
        }

        ToolbarItem(placement: .principal) {
            Text("Your activity")
                .fontModifier(size: 15, weight: .semibold, foregroundColor: .primary)
        }
    }
}


