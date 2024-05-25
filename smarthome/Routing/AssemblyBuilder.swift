//
//  AssemblyBuilder.swift
//  smarthome
//
//  Created by Dmitriy Shrayber on 21.05.2024.
//

import UIKit
import SwiftUI

import Foundation

public class AssemblyBuilder {
    public static func createDevicesModule(router: DevicesRouterProtocol) -> UIViewController {
        let service: DevicesServiceProtocol = DevicesService()
        let storage: DevicesStorageProtocol = DevicesStorage()
        let repository: DevicesRepositoryProtocol = DevicesRepository(service: service, storage: storage)
        let presenter = DevicesPresenter(repository: repository, router: router)
        let view = DevicesViewController()
        view.presenter = presenter
        presenter.view = view
        return view
    }

    public static func createSettingsModule(router: DevicesRouterProtocol) -> UIViewController {
        let service: SettingsServiceProtocol = SettingsService()
                let storage: SettingsStorageProtocol = SettingsStorage()
                let viewModel = SettingsViewModel(service: service, storage: storage)
                return UIHostingController(rootView: SettingsView(viewModel: viewModel))
    }

    public static func createProfileModule(router: ProfileRouterProtocol) -> UIViewController {
        let service: ProfileServiceProtocol = ProfileService()
        let storage: ProfileStorageProtocol = ProfileStorage()
        let userService: UserServiceProtocol = UserService()
        let userStorage: UserStorageProtocol = UserStorage()
        let repository = UserRepository(service: userService, storage: userStorage)
        let presenter = ProfilePresenter(service: service, storage: storage,userRepository: repository, router: router)
        let view = ProfileViewController()
        view.presenter = presenter
        presenter.view = view
        return view
    }

    public static func createProfileDetailsModule(router: ProfileDetailsRouterProtocol) -> UIViewController {
        let view = ProfileDetailsViewController()
        let presenter = ProfileDetailsPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }

    public static func createAuthModule(router: MainRouterProtocol) -> UIViewController {
        let service: UserServiceProtocol = UserService()
        let storage: UserStorageProtocol = UserStorage()
        let repository = UserRepository(service: service, storage: storage)
        let view = AuthViewController()
        let presenter = AuthPresenter(view: view, userRepository: repository, router: router)
        view.presenter = presenter
        return view
    }
    public static func createSplashScreenModule(router: MainRouterProtocol) -> UIViewController {
        let service: UserServiceProtocol = UserService()
        let storage: UserStorageProtocol = UserStorage()
        let view = SplashScreenViewController()
        let repository = UserRepository(service: service, storage: storage)
        let presenter = SplashScreenPresenter(view: view, router: router, userRepository: repository)
        view.presenter = presenter
        return view
    }
}
