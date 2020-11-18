//
//  ListingViewController.swift
//  NYTimesSampleApp
//
//  Created by Ahmad Jabri on 18/11/2020.
//  Copyright © 2020 Ahmad Jabri. All rights reserved.
//

import UIKit

class ListingViewController: BaseViewController {
    
    var articleViewModels = [ArticleViewModel]() {
        didSet {
            tableView?.reloadData()
        }
    }
    
    
    @IBOutlet private (set) weak var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
}

private extension ListingViewController {
    func configureView() {
        title = "NY Time Most Popular"
        tableView?.registerNib(ArticleCell.self)
    }
}

extension ListingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCell.identifier) as? ArticleCell else { return UITableViewCell()}
        cell.articleViewModel = articleViewModels[indexPath.row]
        
        return cell
    }
}

