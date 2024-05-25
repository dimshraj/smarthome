//
//  ProfileRouter.swift
//  smarthome
//
//  Created by Dmitriy Shrayber on 22.05.2024.
//

import UIKit

public protocol ProfileRouterProtocol {
    func showProfileDetails()
    func logout()
}

class ProfileRouter: ProfileRouterProtocol {
    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func showProfileDetails() {
        let router = ProfileDetailsRouter(navigationController: UINavigationController())
        let profileDetailsViewController = AssemblyBuilder.createProfileDetailsModule(router: router)
        router.navigationController.viewControllers = [profileDetailsViewController]
        router.navigationController.modalPresentationStyle = .fullScreen
        router.navigationController.modalTransitionStyle = .crossDissolve
        self.navigationController.present(router.navigationController, animated: false)
    }

    func logout() {
        let splashScreen = AssemblyBuilder.createSplashScreenModule(router: MainRouter())
        UIApplication.shared.setRootViewController(splashScreen)
//        mainRouter.logout()
//        mainRouter.showAuthScreen() вместо передачи роутера лучше подключить UserRepository удалить пользователя и вызвать splashScreen который проверяет авторизацию и ведет к авторизации? (одна точка входа в приложение) 
    }
}
