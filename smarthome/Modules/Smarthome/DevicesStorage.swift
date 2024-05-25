//
//  DevicesStorage.swift
//  smarthome
//
//  Created by Dmitriy Shrayber on 21.05.2024.
//

import Foundation
import CoreData

protocol DevicesStorageProtocol {
    func saveDevices(_ Devices: [Device])
    func fetchDevices() -> [Device]
    func deleteAllDevices()
}

class DevicesStorage: DevicesStorageProtocol {
    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext = CoreDataStack.shared.context) {
        self.context = context
    }

    func saveDevices(_ Devices: [Device]) {
        deleteAllDevices() 

        for Device in Devices {
            let DeviceEntity = DeviceEntity(context: context)
            DeviceEntity.title = Device.title
            DeviceEntity.releaseDate = Date()
        }

        do {
            try context.save()
        } catch {
            print("Failed to save Devices: \(error)")
        }
    }

    func fetchDevices() -> [Device] {
        let fetchRequest: NSFetchRequest<DeviceEntity> = DeviceEntity.fetchRequest()

        do {
            let DeviceEntities = try context.fetch(fetchRequest)
            return DeviceEntities.map { Device(id: $0.id ?? "", title: $0.title ?? "", description: $0.descr ?? "") }
        } catch {
            print("Failed to fetch Devices: \(error)")
            return []
        }
    }

    func deleteAllDevices() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = DeviceEntity.fetchRequest()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try context.execute(deleteRequest)
        } catch {
            print("Failed to delete Devices: \(error)")
        }
    }
}
