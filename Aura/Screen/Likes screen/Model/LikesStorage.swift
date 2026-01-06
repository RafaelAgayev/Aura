//
//  LikesStorage.swift
//  Aura
//
//  Created by Rafael Agayev on 06.01.26.
//

import Foundation

enum LikesStorage {
    private static let key = "likes_users"

    static func save(_ users: [LikeUser]) {
        if let data = try? JSONEncoder().encode(users) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }

    static func load() -> [LikeUser]? {
        guard let data = UserDefaults.standard.data(forKey: key),
              let users = try? JSONDecoder().decode([LikeUser].self, from: data)
        else { return nil }

        return users
    }
}
