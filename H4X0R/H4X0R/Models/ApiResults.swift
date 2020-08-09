//
//  PostCodable.swift
//  H4X0R
//
//  Created by Nico Niebergall on 09.08.20.
//  Copyright © 2020 Nico Niebergall. All rights reserved.
//

import Foundation

// MARK: - Results
struct ApiResults : Codable {
    let hits: [Post]
}

// MARK: - Post
struct Post : Codable, Identifiable {
    var id: String {
        return objectID
    }
    
    let createdAt: Int
    let title: String
    var url: String?
    let author: String
    let points: Int
    let numComments: Int
    let objectID: String
    
    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at_i"
        case title, url, author, points
        case numComments = "num_comments"
        case objectID
    }
}
