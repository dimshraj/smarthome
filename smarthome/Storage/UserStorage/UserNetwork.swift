//
//  UserNetwork.swift
//  smarthome
//
//  Created by Dmitriy Shrayber on 23.05.2024.
//

import Foundation

public protocol UserServiceProtocol {
    func login(completion: @escaping (Result<User, DataError>)->())
}

class UserService: UserServiceProtocol {
    func login(completion: @escaping (Result<User, DataError>) -> ()) {
        completion(.success(User(id: "5", name: "Name", token: "token")))
    }
    
//        let network = APIManager()
//        newtwork.getUser{ user in
//            completion(user)
//        }
   
}

//extension APIManager: UserServiceProtocol {
//    func fetchUser(completion: @escaping (User?) -> Void) {
//        let network = APIManager()
//        newtwork.getUser{ user in
//            completion(user)
//        }
//    }
//}
//как вариант APIManager мы можем предварительно сконфигурировать и передать как UserServiceProtocol что бы дернуть тестовую среду
