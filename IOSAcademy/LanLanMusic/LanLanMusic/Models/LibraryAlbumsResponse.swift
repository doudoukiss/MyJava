//
//  LibraryAlbumsResponse.swift
//  LanLanMusic
//
//  Created by Seattle on 2023/10/12.
//

import Foundation

struct LibraryAlbumsResponse: Codable {
    let items: [SavedAlbum]
}

struct SavedAlbum: Codable {
    let added_at: String
    let album: Album
}
