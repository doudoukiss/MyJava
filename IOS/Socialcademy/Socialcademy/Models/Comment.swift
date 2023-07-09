//
//  Comment.swift
//  Socialcademy
//
//  Created by Seattle on 2023/7/9.
//

import Foundation
struct Comment: Identifiable, Equatable, Codable {
    var content: String
    var author: User
    var timestamp = Date()
    var id = UUID()
}

extension Comment {
    static let testComment = Comment(content: "Air Jordan 11", author: User.testUser)
}
