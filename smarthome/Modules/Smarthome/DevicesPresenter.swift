//
//  DevicesPresenter.swift
//  smarthome
//
//  Created by Dmitriy Shrayber on 21.05.2024.
//

import Foundation
import UIKit

public protocol DevicesPresenterProtocol: AnyObject {
    func viewDidLoad()
    func didSelectDevice(at index: Int)
}

public protocol DevicesViewProtocol: AnyObject {
    func displayDevices(_ Devices: [Device])
    func displayError(_ error: String)
}

public class DevicesPresenter: DevicesPresenterProtocol {
    public weak var view: DevicesViewProtocol?
    private let repository: DevicesRepositoryProtocol
    private let router: DevicesRouterProtocol

    public init(repository: DevicesRepositoryProtocol, router: DevicesRouterProtocol) {
        self.repository = repository
        self.router = router
    }

    public func viewDidLoad() {
        repository.fetchDevices { [weak self] Devices in
            self?.view?.displayDevices(Devices)
        }
    }

    public func didSelectDevice(at index: Int) {
        // Handle movie selection
    }
}
