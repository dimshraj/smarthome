//
//  ProfileModel.swift
//  smarthome
//
//  Created by Dmitriy Shrayber on 21.05.2024.
//

import Foundation
public struct UserProfile {
    public let id: Int
    public let name: String
    public let bio: String

    public init(id: Int, name: String, bio: String) {
        self.id = id
        self.name = name
        self.bio = bio
    }
}
