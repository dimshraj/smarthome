//
//  SettingsView.swift
//  smarthome
//
//  Created by Dmitriy Shrayber on 21.05.2024.
//

import Combine

public class SettingsViewModel: ObservableObject, SettingsViewModelProtocol {
    private let service: SettingsServiceProtocol
    private let storage: SettingsStorageProtocol

    @Published public private(set) var settings: [Setting] = []

    public init(service: SettingsServiceProtocol, storage: SettingsStorageProtocol) {
        self.service = service
        self.storage = storage
    }

    public func fetchSettings() {
        service.fetchSettings { [weak self] settings in
            self?.settings = settings
            self?.storage.saveSettings(settings)
        }
    }
}
import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel: SettingsViewModel

    var body: some View {
        NavigationView {
            List(viewModel.settings, id: \.id) { setting in
                VStack(alignment: .leading) {
                    Text(setting.name)
                        .font(.headline)
                    Text(setting.value)
                        .font(.subheadline)
                }
            }
            .navigationBarTitle("Settings")
            .onAppear {
                viewModel.fetchSettings()
            }
        }
    }
}
