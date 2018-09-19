//
//  String+Extensions.swift
//  RedditFeed
//
//  Created by Arnaldo on 9/19/18.
//  Copyright © 2018 Arnaldo. All rights reserved.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
