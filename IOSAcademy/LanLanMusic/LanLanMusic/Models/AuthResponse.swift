//
//  AuthResponse.swift
//  LanLanMusic
//
//  Created by Seattle on 2023/10/9.
//

import Foundation

struct AuthResponse: Codable {
    let access_token: String
    let expires_in: Int
    let refresh_token: String?
    let scope: String
    let token_type: String
}
