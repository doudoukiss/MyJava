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
    var imageURL: URL?
}

extension User {
    static let testUser = User(
        id: "",
        name: "A picture",
        imageURL: URL(string: "https://source.unsplash.com/lw9LrnpUmWw/480x480")
    )
}
