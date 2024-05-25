//
//  Router.swift
//  smarthome
//
//  Created by Dmitriy Shrayber on 21.05.2024.
//

import UIKit

public protocol RouterProtocol {
    var navigationController: UINavigationController? { get set }
}
    
public protocol MainRouterProtocol: RouterProtocol {
    func splashScreen()
    func showAuthScreen()
    func showMainScreen()
    func showLimitedMainScreen()
    func handleDeepLink(type: String)
    func handlePush(type: String)
}


class MainRouter: MainRouterProtocol {
    
    func splashScreen() {}
    
    func handleDeepLink(type: String) {}
    
    func handlePush(type: String) {}
    
    var navigationController: UINavigationController?
    
    private var tabBarControllers: [String: UINavigationController] = [:]

    init(navigationController: UINavigationController? = nil) {
        self.navigationController = navigationController
    }

    func initialViewController() {
//        isAuthenticated { [weak self] authenticated  in
//            guard let self else {return}
//            if authenticated {
//                showMainScreen()
//            } else {
//                showAuthScreen()
//            }
//        }
    }

//    private func isAuthenticated(completion: @escaping (Bool) -> Void) {
//        userRepository.fetchUser { user in
//            let isAuthenticated = user?.token != nil
//            completion(isAuthenticated)
//        }
//    }

    func showMainScreen() {
        let tabBarController = UITabBarController()

        let DevicesRouter = DevicesRouter(navigationController: UINavigationController())
        let profileRouter = ProfileRouter(navigationController: UINavigationController())

        let DevicesViewController = AssemblyBuilder.createDevicesModule(router: DevicesRouter)
        let profileViewController = AssemblyBuilder.createProfileModule(router: profileRouter)

        let DevicesNavigationController = DevicesRouter.navigationController
        let profileNavigationController = profileRouter.navigationController

        DevicesNavigationController.viewControllers = [DevicesViewController]
        profileNavigationController.viewControllers = [profileViewController]

        DevicesNavigationController.tabBarItem = UITabBarItem(title: "Devices", image: UIImage(systemName: "film"), tag: 0)
        profileNavigationController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), tag: 1)

        tabBarController.viewControllers = [DevicesNavigationController, profileNavigationController]

        tabBarControllers["Devices"] = DevicesNavigationController
        tabBarControllers["profile"] = profileNavigationController
        UIApplication.shared.setRootViewController(tabBarController)
    }

    func showLimitedMainScreen() {
        let profileRouter = ProfileRouter(navigationController: UINavigationController())
        let profileViewController = AssemblyBuilder.createProfileModule(router: profileRouter)

        let profileNavigationController = profileRouter.navigationController
        profileNavigationController.viewControllers = [profileViewController]
        UIApplication.shared.setRootViewController(profileNavigationController)
    }

    func showAuthScreen() {
        let authViewController = AssemblyBuilder.createAuthModule(router: self)
        let authNavigationController = UINavigationController(rootViewController: authViewController)
        UIApplication.shared.setRootViewController(authNavigationController)
    }
}

