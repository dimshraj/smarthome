//
//  ProfileDetailsPresenter.swift
//  smarthome
//
//  Created by Dmitriy Shrayber on 21.05.2024.
//

import Foundation

public protocol ProfileDetailsPresenterProtocol {
    func dismiss()
}


public class ProfileDetailsPresenter: ProfileDetailsPresenterProtocol {
    private weak var view: ProfileDetailsViewProtocol?
    private let router: ProfileDetailsRouterProtocol

    public init(view: ProfileDetailsViewProtocol, router: ProfileDetailsRouterProtocol) {
        self.view = view
        self.router = router
    }
    public func dismiss() {
        router.dismiss()
    }
}

public protocol ProfileDetailsViewProtocol: AnyObject {
    // Define methods to update the view
}
