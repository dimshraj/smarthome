//
//  DevicesRouter.swift
//  smarthome
//
//  Created by Dmitriy Shrayber on 22.05.2024.
//

import UIKit

public protocol DevicesRouterProtocol {
    func showSettings()
}

class DevicesRouter: DevicesRouterProtocol {
    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func showSettings() {
        let SettingsViewController = AssemblyBuilder.createSettingsModule(router: self)
        navigationController.pushViewController(SettingsViewController, animated: true)
    }
}
