//
//  StateStorage.swift
//  smarthome
//
//  Created by Dmitriy Shrayber on 21.05.2024.
//

import Foundation
import CoreData
import Foundation


protocol UserStorageProtocol {
    func saveUser(user: User)
    func fetchUser() -> User?
    func deleteUser()
}

class UserStorage: UserStorageProtocol {
    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext = CoreDataStack.shared.context) {
        self.context = context
    }

    func saveUser(user: User) {

        let newUser = UserEntity(context: context)
        newUser.token = user.token
        newUser.id = user.id
        newUser.name = user.name
        do {
            try context.save()
        } catch {
            print("Failed to save token: \(error)")
        }
    }

    func fetchUser() -> User? {
        let fetchRequest: NSFetchRequest<UserEntity> = UserEntity.fetchRequest()

        do {
            let userEntities = try context.fetch(fetchRequest)
            return userEntities.first(where: {$0.token != nil}).map({User(id: $0.id ?? "", name: $0.name ?? "", token: $0.token ?? "")})
        } catch {
            print("Failed to fetch token: \(error)")
            return nil
        }
    }

    func deleteUser() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = UserEntity.fetchRequest()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try context.execute(deleteRequest)
        } catch {
            print("Failed to delete token: \(error)")
        }
    }
}
