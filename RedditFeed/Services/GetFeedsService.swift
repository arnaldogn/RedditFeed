//
//  GetEntriesService.swift
//  RedditFeed
//
//  Created by Arnaldo on 9/18/18.
//  Copyright © 2018 Arnaldo. All rights reserved.
//

import Foundation

typealias FeedBaseCompletion = (FeedBase?, Error?) -> ()
typealias FeedCompletion = ([Feed]?, Error?) -> ()

protocol GetFeedsServiceProtocol {
    func fetchTop(completion: @escaping FeedBaseCompletion)
}

struct GetFeedsService: GetFeedsServiceProtocol {
    internal func fetchTop(completion: @escaping FeedBaseCompletion) {
        APIManager.shared.request(url: Constants.Url.top, completion: completion)
    }
}
