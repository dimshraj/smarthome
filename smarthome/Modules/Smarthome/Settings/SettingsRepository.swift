//
//  SettingsRepository.swift
//  smarthome
//
//  Created by Dmitriy Shrayber on 21.05.2024.
//

import Foundation

public protocol SettingsServiceProtocol {
    func fetchSettings(completion: @escaping ([Setting]) -> Void)
}

public protocol SettingsStorageProtocol {
    func saveSettings(_ settings: [Setting])
    func getSettings() -> [Setting]
}

class SettingsService: SettingsServiceProtocol {
    func fetchSettings(completion: @escaping ([Setting]) -> Void) {

       let settings = [Setting(id: 0, name: "Power", value: "off")]
        completion(settings)
    }
}

class SettingsStorage: SettingsStorageProtocol {
    private var settings: [Setting] = []

    func saveSettings(_ Settings: [Setting]) {
        self.settings = Settings
    }

    func getSettings() -> [Setting] {
        return settings
    }
}
