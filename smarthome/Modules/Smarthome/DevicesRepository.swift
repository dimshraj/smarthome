//
//  DevicesRepository.swift
//  smarthome
//
//  Created by Dmitriy Shrayber on 21.05.2024.
//

import Foundation

public protocol DevicesServiceProtocol {
    func fetchDevices(completion: @escaping ([Device]) -> Void)
}
class DevicesService: DevicesServiceProtocol {
    func fetchDevices(completion: @escaping ([Device]) -> Void) {
        // Mock network call
        let Devices = [Device(id: "1", title: "Socket", description: "socket in bedroom")]
        completion(Devices)
    }
}

public protocol DevicesRepositoryProtocol {
    func fetchDevices(completion: @escaping ([Device]) -> Void)
}


class DevicesRepository: DevicesRepositoryProtocol {
    private let service: DevicesServiceProtocol
    private let storage: DevicesStorageProtocol

    init(service: DevicesServiceProtocol, storage: DevicesStorageProtocol) {
        self.service = service
        self.storage = storage
    }

    func fetchDevices(completion: @escaping ([Device]) -> Void) {
        let cachedDevices = storage.fetchDevices()
        if !cachedDevices.isEmpty {
            completion(cachedDevices)
        } else {
            service.fetchDevices { [weak self] devices in
                self?.storage.saveDevices(devices)
                completion(devices)
            }
        }
    }
}
