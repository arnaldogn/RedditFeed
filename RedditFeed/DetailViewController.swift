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
        // Update the user interface for the detail item.
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
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: FeedDataModel? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

