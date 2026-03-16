//
//  RecentSearchesModel.swift
//  Aura
//
//  Created by Rafael Agayev on 27.01.26.
//

import SwiftUI

struct RecentSearchesModel: Identifiable, Hashable{
    
    let id: UUID
    
    var name: String
    
    var image: ImageResource
    
    var founder: String
    
    var years: String
    
}
