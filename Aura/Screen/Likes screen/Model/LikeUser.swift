//
//  LikeUser.swift
//  Aura
//
//  Created by Rafael Agayev on 06.01.26.
//

import Foundation

struct LikeUser: Identifiable, Codable{
    
    let id: UUID
    
    var username: String
    
    var time: String
    
    var isLiked: Bool
    
    init(id: UUID = UUID(), username: String, time: String, isLiked: Bool = false) {
        self.id = id
        self.username = username
        self.time = time
        self.isLiked = isLiked
    }
}
