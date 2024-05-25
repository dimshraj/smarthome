//
//  DevicesModel.swift
//  smarthome
//
//  Created by Dmitriy Shrayber on 21.05.2024.
//

import Foundation

public struct Device {
    public let id: String
    public let title: String
    public let description: String

    public init(id: String, title: String, description: String) {
        self.id = id
        self.title = title
        self.description = description
    }
}
