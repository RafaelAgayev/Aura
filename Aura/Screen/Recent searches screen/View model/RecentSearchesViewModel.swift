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
    
     var searchText: String = "" {
        didSet{
            search()
        }
    }
    
    var model: [RecentSearchesModel] = []
    
    func recentVIP(){
        model = [
            RecentSearchesModel(
                id: UUID(uuidString: "00000000-0000-0000-0000-000000000001") ?? UUID(),
                name: "Mark Zuckerberg",
                image: .markZuckerberg,
                founder: "Facebook",
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
                founder: "Football in Man U",
                years: "1996 - ♾️"
            ),
            
            RecentSearchesModel(
                id: UUID(uuidString: "00000000-0000-0000-0000-000000000004") ?? UUID(),
                name: "Alexander Isak",
                image: .alexanderIsak,
                founder: "Football in Newcastle U",
                years: "2002 - ♾️"
            ),
            
            RecentSearchesModel(
                id: UUID(uuidString: "00000000-0000-0000-0000-000000000005") ?? UUID(),
                name: "Cristiano Ronaldo",
                image: .ronaldo,
                founder: "Footbal in Al Nassr",
                years: "1985 - ♾️"
            )
            
        ]
    }
    
    var allNames: [String] = [
        "Mark Zuckerberg",
        "Rafael Agayev",
        "Ronaldo",
        "Sami Nasri",
        "Marcus Rashford",
        "Surat Huseinov",
        "Azad Agayev",
        "Luka Modric",
        "Ousmane Dembele",
        "Alexander Graham Bell",
        "Thomas Edison",
        "Nicola Tesla",
        "Dwayne Johnson",
        "Rey Misterio",
        "Brock Lesnar",
        "Goldberg",
        "Vladimir Putin",
        "Maduro",
        "Alexander Isak",
        "Vinicius jr.",
        "Roque Jr.",
        "David Silva",
        "Rafael Benitez",
        "Rafael Nadal"
    ]
    
    var filteredNames: [String] = []
    
    override init(){
        super.init()
        search()
    }

    private func search() {
        
        let query = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !query.isEmpty else {
            filteredNames = allNames
            return
        }

        filteredNames = allNames.filter {
            $0.localizedCaseInsensitiveContains(query)
        }
    }
}
