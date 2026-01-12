//
//  RecentSearchesViewModel.swift
//  Aura
//
//  Created by Rafael Agayev on 12.01.26.
//

import Foundation
import SwiftUI
internal import Combine

class RecentSearchesViewModel: BaseViewModel{
    
    @Published var searchText: String = "" {
        didSet{
            search()
        }
    }
    
    @Published var allNames: [String] = [
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
    
    @Published var filteredNames: [String] = []
    
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
