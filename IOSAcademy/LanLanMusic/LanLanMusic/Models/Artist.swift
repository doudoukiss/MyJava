//
//  Artist.swift
//  LanLanMusic
//
//  Created by Seattle on 2023/10/8.
//

import Foundation

struct Artist: Codable {
    let id: String
    let name: String
    let type: String
    let images: [APIImage]?
    let external_urls: [String: String]
}

