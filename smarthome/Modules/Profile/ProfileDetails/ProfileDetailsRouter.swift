//
//  ProfileDetailsRouter.swift
//  smarthome
//
//  Created by Dmitriy Shrayber on 24.05.2024.
//

import UIKit
public protocol ProfileDetailsRouterProtocol {
    func dismiss()
}

class ProfileDetailsRouter: ProfileDetailsRouterProtocol {
    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func dismiss() {
        self.navigationController.dismiss(animated: true)
    }
}
