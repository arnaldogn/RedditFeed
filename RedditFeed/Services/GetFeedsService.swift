//
//  GetEntriesService.swift
//  RedditFeed
//
//  Created by Arnaldo on 9/18/18.
//  Copyright © 2018 Arnaldo. All rights reserved.
//

import Foundation

typealias FeedsCompletion = (FeedBase?, Error?) -> ()

protocol GetFeedsServiceProtocol {
    func fetchTop(completion: @escaping FeedsCompletion)
}

struct GetFeedsService: GetFeedsServiceProtocol {
    internal func fetchTop(completion: @escaping FeedsCompletion) {
        APIManager.shared.request(url: Constants.Url.top, completion: completion)
    }
}
