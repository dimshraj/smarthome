//
//  Extentions.swift
//  smarthome
//
//  Created by Dmitriy Shrayber on 21.05.2024.
//

import UIKit

extension UIApplication {
    var keyWindow: UIWindow? {
        guard let windowScene = connectedScenes.first as? UIWindowScene else {
            return nil
        }
        if let keyWindow = windowScene.windows.first(where: { $0.isKeyWindow }) {
            return keyWindow
        } else {
            return windowScene.windows.first
        }
    }

    func setRootViewController(_ viewController: UIViewController) {
        guard let window = keyWindow else { return }
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}
