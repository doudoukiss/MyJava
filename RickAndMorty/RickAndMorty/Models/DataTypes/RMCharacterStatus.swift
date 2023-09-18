//
//  RMCharacterStatus.swift
//  RickAndMorty
//
//  Created by Seattle on 2023/9/17.
//

import Foundation

enum RMCharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case `unknown` = "unknown"
}
