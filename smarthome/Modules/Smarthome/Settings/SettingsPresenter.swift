//
//  SettingsPresenter.swift
//  smarthome
//
//  Created by Dmitriy Shrayber on 21.05.2024.
//

import Foundation

public protocol SettingsViewModelProtocol: AnyObject {
    var settings: [Setting] { get }
    func fetchSettings()
}
protocol SettingsViewProtocol: AnyObject {
    func displaySettings(_ settings: [Setting])
    func displayError(_ error: String)
}

class SettingsPresenter {
    weak var view: SettingsViewProtocol?
    private let service: SettingsServiceProtocol
    private let storage: SettingsStorageProtocol
    private let router: DevicesRouterProtocol

    init(service: SettingsServiceProtocol, storage: SettingsStorageProtocol, router: DevicesRouterProtocol) {
        self.service = service
        self.storage = storage
        self.router = router
    }

    func viewDidLoad() {
        service.fetchSettings { [weak self] settings in
            self?.storage.saveSettings(settings)
            self?.view?.displaySettings(settings)
        }
    }

    func didSelectActor(at index: Int) {
       
    }
}
