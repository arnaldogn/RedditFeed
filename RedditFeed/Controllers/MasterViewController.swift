//
//  MasterViewController.swift
//  RedditFeed
//
//  Created by Arnaldo on 9/18/18.
//  Copyright © 2018 Arnaldo. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var feeds = [Feed]()
    var manager: FeedsManagerProtocol?
    var readFeads: [Bool]?

    override func viewDidLoad() {
        super.viewDidLoad()
        manager = FeedsManager(service: GetFeedsService())
        setupViews()
        loadFeeds()
    }
    
    private func setupViews() {
        title = "Reddit posts"
        tableView.backgroundColor = .black
        tableView.tableFooterView = UIView()
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(loadFeeds), for: .valueChanged)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Remove all", style: .plain, target: self, action: #selector(removeAllTapped))
        
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }
    
    @objc private func removeAllTapped() {
        readFeads?.removeAll()
        feeds.removeAll()
        tableView.reloadData()
    }
    
    @objc private func loadFeeds() {
        manager?.loadFeeds { (response, error) in
            guard let response = response else { return }
            self.feeds.removeAll()
            self.feeds = response
            self.readFeads = [Bool](repeating: false, count: self.feeds.count)
            self.tableView.reloadData()
            self.refreshControl?.endRefreshing()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    // MARK: - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let feed = feeds[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = FeedDataModel(feed: feed)
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feeds.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        readFeads?[indexPath.row] = true
        tableView.reloadRows(at: [indexPath], with: .none)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
        let feed = feeds[indexPath.row]
        cell.delegate = self
        cell.tag = indexPath.row
        cell.configure(feed: FeedDataModel(feed: feed), read: readFeads?[indexPath.row] ?? false)
        return cell
    }
}

extension MasterViewController: FeedCellDelegate {
    func dismissTapped(index: Int) {
        let indexPath = IndexPath(row: index, section: 0)
        feeds.remove(at: index)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
}

