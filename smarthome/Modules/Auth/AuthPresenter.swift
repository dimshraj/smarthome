//
//  AuthPresenter.swift
//  smarthome
//
//  Created by Dmitriy Shrayber on 21.05.2024.
//

import Foundation

public protocol AuthPresenterProtocol {
    func login(email: String, password: String)
    
}

public class AuthPresenter: AuthPresenterProtocol {
    private weak var view: AuthViewProtocol?
    private let router: MainRouterProtocol
    private var userRepository: UserRepositoryProtocol
    
    public init(view: AuthViewProtocol, userRepository: UserRepositoryProtocol, router: MainRouterProtocol) {
        self.view = view
        self.userRepository = userRepository
        self.router = router
    }

    public func login(email: String, password: String) {
        // Симулируем успешную авторизацию
        if email == "login" && password == "pass" {
            userRepository.login {[weak self] result in
                guard let self else {return}
                switch result {
                case .success(let success):
                    router.showMainScreen()
                case .failure(let failure):
                    view?.showError("Something went wrong")
                }
            }
        } else {
            view?.showError("Invalid email or password")
        }
    }
}
