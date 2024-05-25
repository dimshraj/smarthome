//
//  SplashScreenPresenter.swift
//  smarthome
//
//  Created by Dmitriy Shrayber on 24.05.2024.
//

import Foundation


public protocol SplashScreenViewProtocol: AnyObject {
   
}

public protocol SplashScreenPresenterProtocol: AnyObject {
    func appCheckin()
}

public class SplashScreenPresenter: SplashScreenPresenterProtocol {
    private weak var view: SplashScreenViewProtocol?
    private var router: MainRouterProtocol
    private var userRepository: UserRepositoryProtocol 
    
    public init(view: SplashScreenViewProtocol, router: MainRouterProtocol, userRepository: UserRepositoryProtocol) {
        self.view = view
        self.router = router
        self.userRepository = userRepository
    }

    public func appCheckin() {
        userRepository.fetchUser(completion: {[weak self] user in
            guard let self else {return}
            if user != nil {
                router.showMainScreen()
            } else {
                router.showAuthScreen()
            }
        })
        
    }
}
