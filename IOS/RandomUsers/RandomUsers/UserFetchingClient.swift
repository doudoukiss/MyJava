//
//  UserFetchingClient.swift
//  RandomUsers
//
//  Created by Seattle on 2023/6/30.
//

import Foundation

struct UserFetchingClient {
    static private let url = URL(string: "https://randomuser.me/api/?results=10&format=pretty")!
    
    static func getUsers() async throws -> [User] {
        async let (data, _) = URLSession.shared.data(from: url)
        let responses = try await JSONDecoder().decode(Response.self, from: data)
        return responses.users
    }
}
