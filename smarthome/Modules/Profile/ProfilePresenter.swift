//
//  ProfilePresenter.swift
//  smarthome
//
//  Created by Dmitriy Shrayber on 21.05.2024.
//

import Foundation

public protocol ProfilePresenterProtocol: AnyObject {
    func viewDidLoad()
    func logout()
    func showProfileDetails()
}

public protocol ProfileViewProtocol: AnyObject {
    func displayUserProfile(_ profile: UserProfile)
    func showError(_ message: String)
}

public class ProfilePresenter: ProfilePresenterProtocol {
    public weak var view: ProfileViewProtocol?
    private let service: ProfileServiceProtocol
    private let storage: ProfileStorageProtocol
    private let userRepository: UserRepositoryProtocol
    private let router: ProfileRouterProtocol

    public init(service: ProfileServiceProtocol,
                storage: ProfileStorageProtocol,
                userRepository: UserRepositoryProtocol,
                router: ProfileRouterProtocol
    ) {
        self.service = service
        self.storage = storage
        self.userRepository = userRepository
        self.router = router
    }

    public func viewDidLoad() {
        if let profile = storage.getUserProfile() {
            view?.displayUserProfile(profile)
        } else {
            service.fetchUserProfile { [weak self] profile in
                self?.storage.saveUserProfile(profile)
                self?.view?.displayUserProfile(profile)
            }
        }
    }

    public func logout() {
        userRepository.logout {[weak self]  result in
            guard let self else {return}
            switch result {
            case .success(let success):
                router.logout()
            case .failure(let failure):
                print(failure.description)
            }
        }
    }

    public func showProfileDetails() {
        router.showProfileDetails()
    }
}
