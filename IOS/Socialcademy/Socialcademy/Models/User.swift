//
//  User.swift
//  Socialcademy
//
//  Created by Seattle on 2023/7/9.
//

import Foundation

struct User: Identifiable, Equatable, Codable {
    var id: String
    var name: String
}

extension User {
    static let testUser = User(id: "", name: "Ray Allen")
}
