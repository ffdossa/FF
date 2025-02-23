//
//  PostModel.swift
//  FF
//
//  Created by Andrii Marchuk on 23.02.2025.
//

import  Foundation

struct ContentModel: Codable, Identifiable {
    var id = UUID().uuidString
    let author: UserModel
    let authorID: String
    let content: String
    var likeCount: Int
    var likedUser: [String]
    let isResponse: Bool
    let parentID: String?
}
