//
//  DetailViewController.swift
//  RedditFeed
//
//  Created by Arnaldo on 9/18/18.
//  Copyright © 2018 Arnaldo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func configureView() {
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                label.text = detail.title
            }
            if let usernameLbl = usernameLbl {
                usernameLbl.text = detail.author
            }
            if let imageView = imageView {
                imageView.download(from: detail.thumbnailUrl)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    var detailItem: FeedDataModel? {
        didSet {
            configureView()
        }
    }
}

