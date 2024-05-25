//
//  ProfileRepository.swift
//  smarthome
//
//  Created by Dmitriy Shrayber on 21.05.2024.
//

import Foundation
public protocol ProfileServiceProtocol {
    func fetchUserProfile(completion: @escaping (UserProfile) -> Void)
}
public class ProfileService: ProfileServiceProtocol {
    public init() {}

    public func fetchUserProfile(completion: @escaping (UserProfile) -> Void) {
        // Mock network call
        let profile = UserProfile(id: 1, name: "John Doe", bio: "Software Engineer")
        completion(profile)
    }
}
public protocol ProfileStorageProtocol {
    func saveUserProfile(_ profile: UserProfile)
    func getUserProfile() -> UserProfile?
}
public class ProfileStorage: ProfileStorageProtocol {
    private var userProfile: UserProfile?

    public init() {}

    public func saveUserProfile(_ profile: UserProfile) {
        self.userProfile = profile
    }

    public func getUserProfile() -> UserProfile? {
        return userProfile
    }
}
