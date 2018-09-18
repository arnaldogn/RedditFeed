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
}

struct FeedChildren: Decodable {
    let data: Feed
}

struct Feed: Decodable {
    let title: String
}
