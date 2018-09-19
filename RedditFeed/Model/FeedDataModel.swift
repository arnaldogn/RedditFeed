//
//  FeedDataModel.swift
//  RedditFeed
//
//  Created by Arnaldo on 9/19/18.
//  Copyright © 2018 Arnaldo. All rights reserved.
//

import Foundation

struct FeedDataModel {
    let feed: Feed
    
    var title: String {
        return feed.title
    }
    var author: String {
        return feed.author
    }
    var thumbnailUrl: String {
        return feed.thumbnail
    }
    var createdDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: feed.created)
    }
    var commentsCount: String {
        return "\(String(feed.numComments)) \("comments".localized)"
    }
}
