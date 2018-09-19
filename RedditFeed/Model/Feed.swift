//
//  Feed.swift
//  RedditFeed
//
//  Created by Arnaldo on 9/18/18.
//  Copyright © 2018 Arnaldo. All rights reserved.
//

import Foundation

struct FeedBase: Decodable {
    let data: FeedData
}

struct FeedData: Decodable {
    let children: [FeedChildren]
    let after: String?
}

struct FeedChildren: Decodable {
    let data: Feed
}

struct Feed: Decodable {
    let title: String
    let thumbnail: String
    let author: String
    let created: Date
    let numComments: Int
    
    enum CodingKeys: String, CodingKey {
        case title
        case thumbnail
        case author
        case created = "created_utc"
        case numComments = "num_comments"
    }
}
