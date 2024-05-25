//
//  UserRepository.swift
//  smarthome
//
//  Created by Dmitriy Shrayber on 23.05.2024.
//

import Foundation

public protocol UserRepositoryProtocol {
    func fetchUser(completion: @escaping (User?) -> Void)
    func login(completion: @escaping (Result<User, DataError>)->())
    func logout(completion: @escaping (Result<Bool, DataError>)->())
}

class UserRepository: UserRepositoryProtocol {

    private let service: UserServiceProtocol
    private let storage: UserStorageProtocol
    
    init(service: UserServiceProtocol, storage: UserStorageProtocol) {
        self.service = service
        self.storage = storage
    }
    
    func fetchUser(completion: @escaping (User?) -> Void) {
        let cachedUser = storage.fetchUser()
        completion(cachedUser)
    }
    func logout(completion: @escaping (Result<Bool, DataError>)->()) {
        storage.deleteUser()
        completion(.success(true))
    }
    
    func login(completion: @escaping (Result<User, DataError>) -> ()) {
        service.login { [weak self] result in
            guard let self else {return}
            switch result {
            case .success(let user):
                self.storage.saveUser(user: user)
            case .failure(let failure):
                completion(.failure(.noData))
            }
        }
    }
}
