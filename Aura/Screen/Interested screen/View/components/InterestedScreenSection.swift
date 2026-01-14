//
//  InterestedScreenSection.swift
//  Aura
//
//  Created by Rafael Agayev on 13.01.26.
//

import SwiftUI

struct InterestedScreenSection: View {
    
    @Binding var isLoading: Bool
    
    @Binding var errorMessage: String?
    
    @Binding var hasData: Bool
    
    @Binding var items: [InterestedItemModel]
    
    var loadData: () -> Void
    
    var onItemTap: (InterestedScreen.Item) -> Void
    
    var body: some View {
        
        ZStack{
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            if isLoading{
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .colorAccent))
            }else if let error = errorMessage{
                VStack{
                    Image(systemName: "exclamationmark.triangle.fill")

                        .fontModifier(size: 50, weight: .semibold, foregroundColor: .colorAccent)
                    Text(error)
                        .font(.headline)
                        .foregroundStyle(.colorBlack)
                        .padding()
                    Button{
                        loadData()
                    }label: {
                        Text("Retry")
                    }
                    .padding()
                    .background(Color.colorBlue)
                    .foregroundStyle(.colorWhite)
                    .roundedCorners(cornerRadius: 8)
                    
                }
            }else if hasData{
                ScrollView{
                    VStack(spacing: 16) {
                        ForEach(items, id: \.self) { item in
                            HStack(spacing: 16){
                                if let image = item.systemImage{
                                    Image(systemName: image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 35, height: 35)
                                        .foregroundStyle(.colorAccent)
                                }
                                VStack(alignment: .leading, spacing: 4){
                                    Text(item.title)
                                        .fontModifier(size: 16, weight: .semibold, foregroundColor: .colorBlack)
                                    
                                    Text(item.description)
                                        .lineLimit(2)
                                        .fontModifier(size: 12, weight: .medium, foregroundColor: .colorGray)
                                    
                                }
                                Spacer()
                            }
                            .padding()
                            .background(Color(.secondarySystemBackground))
                            .roundedCorners(cornerRadius: 10)
                            .onTapGesture {
                                onItemTap(item.type)
                            }
                        }
                    }
                }
            }else {
                Text("No content available")
                    .font(.title2)
                    .foregroundStyle(.colorBlack)
            }
        }
        .refreshable {
            loadData()
        }
    }
}


