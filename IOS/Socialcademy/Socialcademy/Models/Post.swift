//
//  Post.swift
//  Socialcademy
//
//  Created by Seattle on 2023/7/6.
//

import Foundation

struct Post: Identifiable, Equatable, Codable {
    var title: String
    var content: String
    var authorName: String
    var isFavorite = false
    var timestamp = Date()
    var id = UUID()
    
    func contains(_ string: String) -> Bool {
        let properties = [title, content, authorName].map { $0.lowercased() }
        let query = string.lowercased()
        
        let matches = properties.filter { $0.contains(query) }
        return !matches.isEmpty
    }
}

extension Post {
    static let testPost = Post(
        title: "Seattle Supersonics",
        content: "Seattle SuperSonics won the NBA championship in 1979. The franchise won Western Conference titles in 1978, 1979 and 1996; and six divisional titles—their last being in 2005—five in the Pacific Division and one in the Northwest Division. The franchise attained a 1,745–1,585 (.524) regular season win–loss record,[9] as well as a 107–110 (.493) playoff win–loss record during its time in Seattle.[citation needed] Both marks would rank in the top half of the NBA's all-time standings. Settlement terms of a lawsuit between the city of Seattle and Clay Bennett's ownership group stipulated SuperSonics' banners, trophies and retired jerseys remain in Seattle; the nickname, logo and color scheme are available to any subsequent NBA team that plays at KeyArena subject to NBA approval.[10] The SuperSonics' franchise history, however, would be shared with the Thunder.[11]",
        authorName: "Ray Allen"
    )
}
