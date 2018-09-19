//
//  FeedCell.swift
//  RedditFeed
//
//  Created by Arnaldo on 9/18/18.
//  Copyright © 2018 Arnaldo. All rights reserved.
//

import UIKit

protocol FeedCellDelegate: class {
    func dismissTapped(index: Int)
}

class FeedCell: UITableViewCell {
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var markView: UIView!
    @IBOutlet weak var postTimeLbl: UILabel!
    @IBOutlet weak var dismissBtn: UIButton!
    @IBOutlet weak var commentsBtn: UIButton!
    weak var delegate: FeedCellDelegate?
        
    func configure(feed: FeedDataModel, read: Bool) {
        accessoryType = .disclosureIndicator
        selectionStyle = .none
        markView.layer.cornerRadius = 5
        markView.isHidden = read
        titleLbl.text = feed.title
        usernameLbl.text = feed.author
        postTimeLbl.text = feed.createdDate
        commentsBtn.setTitle(feed.commentsCount, for: .normal)
        thumbnail?.download(from: feed.thumbnailUrl)
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        delegate?.dismissTapped(index: tag)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        thumbnail.image = nil
    }
}
