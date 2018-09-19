//
//  FeedCell.swift
//  RedditFeed
//
//  Created by Arnaldo on 9/18/18.
//  Copyright © 2018 Arnaldo. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var readMarkImg: UIImageView!
    @IBOutlet weak var postTimeLbl: UILabel!
    @IBOutlet weak var dismissBtn: UIButton!
    @IBOutlet weak var commentsBtn: UIButton!
        
    func configure(feed: FeedDataModel) {
        accessoryType = .disclosureIndicator
        selectionStyle = .none
        titleLbl.text = feed.title
        usernameLbl.text = feed.author
        postTimeLbl.text = feed.createdDate
        commentsBtn.setTitle(feed.commentsCount, for: .normal)
        thumbnail?.download(from: feed.thumbnailUrl)
    }
}
