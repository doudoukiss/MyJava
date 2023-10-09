//
//  SettingsModels.swift
//  LanLanMusic
//
//  Created by Seattle on 2023/10/9.
//

import Foundation

struct Section {
    let title: String
    let options: [Option]
}

struct Option {
    let title: String
    let handler: () -> Void
}
