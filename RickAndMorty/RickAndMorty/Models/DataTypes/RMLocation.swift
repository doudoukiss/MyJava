//
//  RMLocation.swift
//  RickAndMorty
//
//  Created by Seattle on 2023/9/17.
//

import Foundation
struct RMLocation: Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}
