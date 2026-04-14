//
//  RecentSearchesViewModel.swift
//  Aura
//
//  Created by Rafael Agayev on 12.01.26.
//

import Foundation
import SwiftUI
internal import Combine

@Observable
class RecentSearchesViewModel: BaseViewModel{
    
    var searchText: String = ""
    
    var model: [RecentSearchesModel] = []
    
    var allModels: [RecentSearchesModel] = []
    
   private func recentVIP(){
        let data = [
            RecentSearchesModel(
                id: UUID(uuidString: "00000000-0000-0000-0000-000000000001") ?? UUID(),
                name: "Mark Zuckerberg",
                image: .markZuckerberg,
                founder: "Meta",
                years: "1984 - ♾️ "
            ),
            
            RecentSearchesModel(
                id: UUID(uuidString: "00000000-0000-0000-0000-000000000002") ?? UUID(),
                name: "Alexander Graham Bell",
                image: .alexanderGrahamBell,
                founder: "Phone",
                years: "1812-1885"
            ),
            
            RecentSearchesModel(
                id: UUID(uuidString: "00000000-0000-0000-0000-000000000003") ?? UUID(),
                name: "Marcus Rashford",
                image: .marcusRashford,
                founder: "Footballer in Barcelona",
                years: "1996 - ♾️"
            ),
            
            RecentSearchesModel(
                id: UUID(uuidString: "00000000-0000-0000-0000-000000000004") ?? UUID(),
                name: "Alexander Isak",
                image: .alexanderIsak,
                founder: "Footballer in Liverpool",
                years: "2002 - ♾️"
            ),
            
            RecentSearchesModel(
                id: UUID(uuidString: "00000000-0000-0000-0000-000000000005") ?? UUID(),
                name: "Cristiano Ronaldo",
                image: .ronaldo,
                founder: "Footballer in Al Nassr",
                years: "1985 - ♾️"
            )
            
        ]
        model = data
        allModels = data
    }
        
    override init(){
        super.init()
        recentVIP()
    }

    func search() {
        let query = searchText.trimmingCharacters(in: .whitespacesAndNewlines)

        guard !query.isEmpty else {
            model = allModels
            return
        }

        model = allModels.filter {
            $0.name.localizedCaseInsensitiveContains(query)
        }
    }
}
