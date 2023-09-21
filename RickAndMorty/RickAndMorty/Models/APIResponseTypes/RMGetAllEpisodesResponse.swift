//
//  RMGetAllEpisodesResponse.swift
//  RickAndMorty
//
//  Created by Seattle on 2023/9/18.
//

import Foundation

struct RMGetAllEpisodesReponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    
    let info: Info
    let results: [RMEpisode]
}
