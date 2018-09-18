//
//  FeedManager.swift
//  RedditFeed
//
//  Created by Arnaldo on 9/18/18.
//  Copyright © 2018 Arnaldo. All rights reserved.
//

import Foundation

class FeedsManager: NSObject {
    let service: GetFeedsServiceProtocol
    
    init(service: GetFeedsServiceProtocol) {
        self.service = service
        super.init()
    }
    
    func loadFeeds(_ completion: @escaping ([Feed]?, Error?)->()) {
        service.fetchTop { (response, error) in
            guard let response = response else { return completion(nil, error) }
            let feeds = response.data.children.compactMap { $0.data }
            completion(feeds, nil)
        }
    }
    
}
