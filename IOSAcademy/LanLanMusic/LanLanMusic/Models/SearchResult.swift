//
//  SearchResult.swift
//  LanLanMusic
//
//  Created by Seattle on 2023/10/13.
//

import Foundation

enum SearchResult {
    case artist(model: Artist)
    case album(model: Album)
    case track(model: AudioTrack)
    case playlist(model: Playlist)
}
