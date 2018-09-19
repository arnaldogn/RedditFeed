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
        let calendar = NSCalendar.current
        let date1 = calendar.startOfDay(for: feed.created)
        let date2 = calendar.startOfDay(for: Date())
        let components = calendar.dateComponents([.hour], from: date2, to: date1)
        guard let hours = components.hour else { return "" }
        return "\(String(hours)) hours ago"
    }
    var commentsCount: String {
        return "\(String(feed.numComments)) \("comments".localized)"
    }
}
