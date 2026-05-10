//
//  CountryModel.swift
//  Aura
//
//  Created by Rafael Agayev on 10.05.26.
//

import Foundation

struct CountryModel: Identifiable, Hashable{
    
    var id = UUID()
    
    let name: String
    let code: String
}
